import json
from itertools import product
from typing import Any, Self, cast, override

from beet import Context, Model

from plugins.bubblellaneous.internal.category import Category
from plugins.bubblellaneous.internal.tree import Tree

from .base import Base
from .block import Block, BlockData, BlockType
from .const.materials import CARDS, COLORS
from .item import Item


def get_translation_name(prefix: str) -> str:
    for material in sorted(
        BlockMaterials.WOOL, key=lambda x: len(x.name), reverse=True
    ):
        if prefix == material.name:
            return prefix
        if material.name in prefix:
            return prefix.replace(f"{material.name}_", "")
    return prefix


class BlockMaterials:
    WOOD: list[BlockData.Material] = [
        BlockData.Material("oak", "oak_planks", "dark_oak_log", base="oak_planks"),
        BlockData.Material(
            "acacia", "acacia_planks", "acacia_log", base="acacia_planks"
        ),
        BlockData.Material(
            "bamboo", "bamboo_planks", "bamboo_fence_particle", base="bamboo_planks"
        ),
        BlockData.Material("birch", "birch_planks", "birch_log", base="birch_planks"),
        BlockData.Material(
            "cherry", "cherry_planks", "cherry_log", base="cherry_planks"
        ),
        BlockData.Material(
            "crimson", "crimson_planks", "warped_stem", base="crimson_planks"
        ),
        BlockData.Material(
            "dark_oak", "dark_oak_planks", "oak_log", base="dark_oak_planks"
        ),
        BlockData.Material(
            "jungle", "jungle_planks", "mangrove_log", base="jungle_planks"
        ),
        BlockData.Material(
            "mangrove", "mangrove_planks", "cherry_log", base="mangrove_planks"
        ),
        BlockData.Material(
            "spruce", "spruce_planks", "spruce_log", base="spruce_planks"
        ),
        BlockData.Material(
            "warped", "warped_planks", "crimson_stem", base="warped_planks"
        ),
    ]

    WOOL: list[BlockData.Material] = [
        BlockData.Material(
            color, f"{color}_wool", f"{color}_terracotta", color=f"{color}_wool"
        )
        for color in COLORS
    ]

    DYE: list[BlockData.Material] = [
        BlockData.Material(
            color, f"{color}", f"{color}_terracotta", color=f"{color}_dye"
        )
        for color in COLORS
    ]

    CARD_DECK: list[BlockData.Material] = []

    for deck in ["spades", "clubs", "hearts", "diamonds"]:
        for card in CARDS:
            CARD_DECK.append(
                BlockData.Material(
                    f"{deck}_{card}",
                    f"{deck}_{card}",
                    f"{deck}_{card}",
                )
            )

    WOOD_WITH_WOOL: list[BlockData.Material] = [
        BlockData.Material(
            f"{wool.name}_{wood.name}",
            wood.primary_texture,
            wool.primary_texture,
            **{**wood.textures, **wool.textures},
        )
        for wood, wool in product(WOOD, WOOL)
    ]

    SOLID: list[BlockData.Material] = [
        *WOOD,
        BlockData.Material("stone", "stone", "smooth_stone", base="stone"),
        BlockData.Material("deepslate", "deepslate", "cut_copper", base="deepslate"),
        BlockData.Material(
            "quartz", "quartz_block_side", "deepslate_tiles", base="quartz_block"
        ),
        BlockData.Material(
            "iron", "iron_block", "smithing_table_top", base="iron_block"
        ),
        BlockData.Material(
            "copper", "copper_block", "smithing_table_top", base="copper_block"
        ),
        BlockData.Material("gold", "gold_block", "raw_gold_block", base="gold_block"),
        BlockData.Material(
            "diamond", "diamond_block", "smithing_table_top", base="diamond_block"
        ),
        BlockData.Material(
            "emerald", "emerald_block", "smithing_table_top", base="emerald_block"
        ),
        BlockData.Material(
            "netherite", "netherite_block", "smithing_table_top", base="netherite_block"
        ),
    ]


class Variant(Base):
    @override
    def allocate_ids(self) -> int:
        return len(self.read_property("material", None)) * max(
            len(self.read_property("blockstates.block_states", [])), 1
        )

    @property
    def unit(self) -> Any:
        pass

    def prepare_variant(
        self,
        material: BlockData.Material,
        material_size: int,
        material_index: int,
        materials: list,
    ) -> Self:
        return self

    @override
    def compile(self, ctx: Context, unit_id: int, tree: Tree) -> Self:
        unit: Block | Item = self.unit(self.category)
        unit.__class__.__doc__ = self.__class__.__doc__
        materials = cast(list[BlockData.Material], self.read_property("material", []))
        material_len = len(materials)
        default_model = set()

        for i, material in enumerate(materials):
            unit.properties = self.prepare_variant(
                material, material_len, i, materials
            ).properties
            unit.compile(ctx, unit_id + i, tree)
            if not unit.prop("is_unlisted"):
                tree.extend_bench_registry(
                    tree.default_format(ctx, self.format),
                    self.category_value,
                    unit.name,
                    "[unit]/[name]",
                )

            if unit.prop("blockstates"):
                continue

            template_model = tree.default_format(ctx, unit.format)(
                "[namespace]:[unit]/[unit_name]"
            )
            default_model.add(template_model)
            ctx.assets.models[f"{template_model}/{material.name}"] = Model(
                {
                    "parent": tree.default_format(ctx, unit.format)(
                        "[namespace]:[unit]/[unit_name]/default"
                    ),
                    "textures": json.loads(
                        json.dumps(ctx.assets.models[template_model].data)
                        .replace("/primary", f"/{material.primary_texture}")
                        .replace("/secondary", f"/{material.secondary_texture}")
                        .replace("/material", f"/{material.name}")
                    ).get("textures"),
                }
            )
            self.add_model(tree, ctx, unit.custom_model_data, None)

        for name in default_model:
            ctx.assets.models[
                tree.default_format(ctx, unit.format)(
                    "[namespace]:[unit]/[unit_name]/default"
                )
            ] = ctx.assets.models[name]
            ctx.assets.models.pop(name)
        return self


class BlockVariant(Variant):
    @property
    @override
    def unit(self):
        return Block

    @override
    def prepare_variant(
        self,
        material: BlockData.Material,
        material_size: int,
        material_index: int,
        materials: list,
    ) -> Self:
        return self.set_properties(
            material=material.name,
            raw_material=material,
            material_len=material_size,
            material_index=material_index,
            materials=materials,
            name=self.name,
            translation_name="_".join(
                [i for i in [get_translation_name(material.name), self.name] if i]
            ),
            base_item="minecraft:item_frame",
            unit="block",
            path=[self.name, material.name],
            is_single=False,
            block_type=self.read_property("block_type", BlockType("default", [])),
            **{
                key: self.read_property(key, None)
                for key in [
                    "base",
                    "sound",
                    "facing",
                    "recipe",
                    "tags",
                    "blockstates",
                    "is_unlisted",
                ]
            },
        )


class ItemVariant(Variant):
    @property
    @override
    def unit(self):
        return Item

    @override
    def prepare_variant(
        self,
        material: BlockData.Material,
        material_size: int,
        material_index: int,
        materials: list,
    ) -> Self:
        return self.set_properties(
            material=material.name,
            raw_material=material,
            material_len=material_size,
            material_index=material_index,
            materials=materials,
            name=self.name,
            translation_name="_".join(
                [i for i in [get_translation_name(material.name), self.name] if i]
            ),
            base_item=self.read_property(
                "base.value", default="minecraft:structure_void"
            ),
            unit="item",
            path=[self.name, material.name],
            is_single=False,
            **{
                key: self.read_property(key, None)
                for key in [
                    "base",
                    "sound",
                    "facing",
                    "recipe",
                    "tags",
                    "blockstates",
                    "is_unlisted",
                ]
            },
        )
