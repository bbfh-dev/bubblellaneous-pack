from itertools import product
from typing import override

from plugins.bubblellaneous.internal.category import Category

from .base import Base
from .block import Block, BlockData
from .item import Item

COLORS = [
    "white",
    "orange",
    "magenta",
    "light_blue",
    "yellow",
    "lime",
    "pink",
    "gray",
    "light_gray",
    "cyan",
    "purple",
    "blue",
    "brown",
    "green",
    "red",
    "black",
]


class BlockMaterials:
    WOOD: list[BlockData.Material] = [
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
        BlockData.Material("oak", "oak_planks", "dark_oak_log", base="oak_planks"),
        BlockData.Material(
            "spruce", "spruce_planks", "spruce_log", base="spruce_planks"
        ),
        BlockData.Material(
            "warped", "warped_planks", "crimson_stem", base="warped_planks"
        ),
    ]

    WOOL: list[BlockData.Material] = [
        BlockData.Material(
            color, f"{color}_wool", f"{color}_terracotta", base=f"{color}_wool"
        )
        for color in COLORS
    ]

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


class Variant[T: Block | Item](Base):
    @override
    def allocate_ids(self) -> int:
        return len(self.read_property("material", None)) * max(
            len(self.read_property("blockstates.block_states", [])), 1
        )

    def __init__(self, category: Category) -> None:
        self.category = category
        super().__init__()
