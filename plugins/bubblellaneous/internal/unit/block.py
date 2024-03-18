import json
from dataclasses import dataclass
from enum import Enum
from typing import Literal, Optional, Self, cast, override

from beet import Context, Model
from colorama import Fore

from plugins.bubblellaneous.internal.category import Category
from plugins.bubblellaneous.internal.template.mcfunction import (
    PLACE_TEMPLATE,
    RECIPE_TEMPLATE,
)
from plugins.bubblellaneous.internal.tree import BenchRegistry, Tree
from plugins.utils.nbt import NBT

from .base import Base


@dataclass
class Direction:
    name: str
    coords: str
    negative_coords: str


DIRECTIONS = [
    Direction("front", "^ ^ ^1", "^ ^ ^-1"),
    Direction("back", "^ ^ ^-1", "^ ^ ^1"),
    Direction("left", "^-1 ^ ^", "^1 ^ ^"),
    Direction("right", "^1 ^ ^", "^-1 ^ ^"),
    Direction("up", "^ ^1 ^", "^ ^-1 ^"),
    Direction("down", "^ ^-1 ^", "^ ^1 ^"),
]


def generate_permutations(string) -> list:
    def generate_helper(substring, index, current_permutation, permutations):
        if index == len(substring):
            permutations.append(current_permutation)
            return
        if substring[index] == "~":
            generate_helper(
                substring, index + 1, current_permutation + "0", permutations
            )
            generate_helper(
                substring, index + 1, current_permutation + "1", permutations
            )
        else:
            generate_helper(
                substring,
                index + 1,
                current_permutation + substring[index],
                permutations,
            )

    permutations = []
    generate_helper(string, 0, "", permutations)
    return permutations


class BlockData:
    class Base(Enum):
        NONE = "air"
        CONTAINER = "barrel[facing=up]"
        HOPPER = "hopper"
        UPPER = "petrified_oak_slab[type=top]"
        LOWER = "petrified_oak_slab[type=bottom]"
        SOLID = "petrified_oak_slab[type=double]"
        TRIPWIRE = "tripwire"
        DRIPSTONE = (
            "pointed_dripstone[thickness=tip,vertical_direction=up,waterlogged=false]"
        )
        CHAIN = "chain[axis=y]"
        VOID = "structure_void"

    class Sound(Enum):
        INDUSTRIAL = "industrial"
        WOOD = "wood"
        WOOL = "wool"

    class Facing(Enum):
        NONE = "none"
        PLAYER = "player"
        PLAYER_PRECISE = "player_precise"
        NORMAL = "normal"
        WALL_NORMAL = "wall_normal"
        DOOR = "door"

    class Uses(Enum):
        GUI = "--local.uses.gui"
        TICK = "--local.uses.tick"
        BRIGHTNESS_FIX = "--local.uses.brightness_fix"
        PLACE = "--local.uses.place"
        BLOCKSTATES = "--local.uses.blockstates"
        NO_BASE = "--local.uses.no_base"
        CUSTOM_BASE = "--local.uses.custom_base"
        TIMER = "--local.uses.timer"
        BLOCKSTATE_HOOK = "--local.uses.blockstate_callback"

    @dataclass
    class RecipeEntry:
        group: str
        name: str
        count: int = 1

        def get_name(self, materials: list[tuple[str, str]]):
            name = self.name
            for material, block in materials:
                name = name.replace(f"[{material}]", block)
            return name

        def get_lore(self, materials: list[tuple[str, str]]):
            return NBT.Quote(
                NBT(
                    [
                        {
                            "text": "› ",
                            "color": "gray",
                            "italic": False,
                        },
                        {
                            "translate": f"{self.group}.minecraft.{self.get_name(materials)}",
                        },
                        " ",
                        {
                            "text": f"× {self.count}",
                            "color": "gold",
                            "italic": False,
                        },
                    ],
                    is_json=True,
                ).get_list()
            )

        def get_entry(self, materials: list[tuple[str, str]]):
            return {
                "id": self.get_name(materials),
                "group": self.group,
                "count": self.count,
                "lore": self.get_lore(materials),
            }

    @dataclass(init=False)
    class Material:
        name: str
        primary_texture: str
        secondary_texture: str
        textures: dict[str, str]

        def __init__(
            self, name: str, primary: str, secondary: str, **kwargs: str
        ) -> None:
            self.name = name
            self.primary_texture = primary
            self.secondary_texture = secondary
            self.textures = kwargs

    @dataclass(init=False)
    class State:
        name: str
        predicates: list[str]

        def __init__(self, name: str, *args: str) -> None:
            self.name = name
            self.predicates = list(args)

        @property
        def path(self) -> str:
            return f"[namespace]:block/[unit_name]/blockstates/apply/{self.name}"

        @property
        def predicate_variations(self):
            result = []
            for predicate in self.predicates:
                if "~" not in predicate:
                    result.append(predicate)
                    continue
                result.extend(generate_permutations(predicate))
            return result

    @dataclass(init=False)
    class BlockStates:
        match: str | Literal["@self"] | Literal["<manual>"]
        block_states: list["BlockData.State"]

        def __init__(self, match: str, *args: "BlockData.State") -> None:
            self.match = match
            self.block_states = list(args)

        @property
        def absolute_match(self) -> str:
            return self.match.replace("!", "")

        @property
        def entity(self) -> str:
            if self.absolute_match == "@self":
                return "@e[type=item_display,tag=local.name.[unit_name],distance=..0.5]"
            return self.absolute_match

        @property
        def block_tag(self) -> str:
            return self.absolute_match.replace("#", "#[namespace]:")

        def predicate(self) -> str:
            def get_condition(value: bool):
                return "if" if not value else "unless"

            condition = get_condition(self.match.startswith("!"))
            if self.absolute_match.startswith("@"):
                return f"execute at @s positioned [coords] {condition} entity {self.entity}"
            return f"execute at @s {condition} block [coords] {self.block_tag}"


class BlockType:
    @classmethod
    def shelf(cls, *, amount: int):
        return BlockType("shelf", [], amount=amount)

    @classmethod
    def seat(cls, *, width: float, height: float):
        return BlockType("seat", [], width=width, height=height)

    @classmethod
    def light(cls, *, light_level: int):
        return BlockType("light", [], light_level=light_level)

    def __init__(self, name: str, template: list[str], **kwargs) -> None:
        self.function_template = template
        self.name = name
        self.params = kwargs


class Block(Base):
    @override
    def allocate_ids(self) -> int:
        return max(len(self.read_property("blockstates.block_states", [])), 1)

    @property
    @override
    def unit_tag(self) -> dict:
        return {
            "EntityTag": {
                "Tags": [
                    "+[namespace]",
                    "local.place",
                    *[i.value for i in self.prop("tags", default=[]) or []],
                ],
                "Invisible": NBT.Byte(1),
                "Fixed": NBT.Byte(1),
                "Invulnerable": NBT.Byte(1),
                "Silent": NBT.Byte(1),
                "Item": {
                    "id": "stone_button",
                    "Count": NBT.Byte(1),
                    "tag": {
                        "[namespace]": {
                            "block_properties": {},
                            "block_data": {
                                **{
                                    key: self.prop(key)
                                    for key in ["name", "base_item", "unit"]
                                },
                                **{
                                    enum: self.enum_prop(enum)
                                    for enum in ["base", "sound", "facing"]
                                },
                                "material": {
                                    "name": self.prop("material", "default"),
                                    "index": self.prop("material_index", 0),
                                },
                                "material_count": self.prop("material_len", 0),
                                "custom_model_data": self.custom_model_data,
                                "display_name": self.display_name,
                                "block_type": {
                                    "name": self.prop("block_type").name,
                                    "parameters": self.prop("block_type").params,
                                },
                                "id": self.complete_name,
                            },
                        }
                    },
                },
            },
        }

    @override
    def prepare(self) -> Self:
        if not self.read_property("base", None):
            parent = self.__class__.mro()[1](self.category)
            block_type = BlockType("default", [])
        else:
            parent = self
            block_type = parent.read_property("block_type", BlockType("default", []))

        return self.set_properties(
            material="",
            name=self.name,
            base_item="minecraft:item_frame",
            unit="block",
            path=[self.name],
            is_single=True,
            block_type=block_type,
            is_unlisted=self.read_property("is_unlisted", False),
            **{
                key: parent.read_property(key, None)
                for key in [
                    "base",
                    "sound",
                    "facing",
                    "recipe",
                    "tags",
                    "blockstates",
                ]
            },
        )

    @override
    def compile(self, ctx: Context, unit_id: int, tree: Tree) -> Self:
        super().compile(ctx, unit_id, tree)

        tree.make_function(
            tree.default_format(ctx, self.format),
            "place:[namespace]/[name]",
            PLACE_TEMPLATE,
        )

        blockstates: BlockData.BlockStates = self.prop("blockstates")
        if not blockstates:
            return self

        if blockstates.match != "<manual>" and self.prop("material_index", 0) == 0:
            tree.make_state_registry(
                self.name,
                [
                    {
                        predicate.split(":")[0]
                        .replace("0", "o")
                        .replace("1", "i")
                        .replace("~", "x"): {
                            "name": state.name,
                            "rotation": (
                                predicate.split(":")[-1] if ":" in predicate else 0
                            ),
                        }
                        for predicate in state.predicate_variations
                    }
                    for state in blockstates.block_states
                ],
            )
            tree.make_function(
                tree.default_format(ctx, self.format),
                "[namespace]:block/[unit_name]/blockstates/update",
                [
                    "function bubblellaneous:block_placer/internal/reset_blockstate",
                    "",
                    "\n".join(
                        [
                            blockstates.predicate()
                            .replace("[coords]", direction.coords)
                            .replace("[-coords]", direction.negative_coords)
                            + f' run data modify storage bubblellaneous tmp.in.bit{i} set value "i"'
                            for i, direction in enumerate(DIRECTIONS)
                        ]
                    ),
                    "",
                    f"data modify storage bubblellaneous tmp.states set from storage bubblellaneous state_registry.{self.name}",
                    f'data modify storage bubblellaneous tmp.block set value "{self.name}"',
                    "function bubblellaneous:block_placer/internal/set_blockstate with storage bubblellaneous tmp.in",
                ],
            )

        for index, state in enumerate(blockstates.block_states):
            self.add_model(
                tree,
                ctx,
                self.custom_model_data + (index * self.prop("material_len", 1)),
                state.name,
            )

            if self.prop("material_index", 0) != 0:
                continue

            tree.make_function(
                tree.default_format(ctx, self.format),
                state.path,
                [
                    "scoreboard players set quit local.tmp 1",
                    f"scoreboard players set @s local.block.model {index}",
                    "execute store result score model_id local.tmp run data get entity @s item.tag.[namespace].block_data.custom_model_data",
                    f"scoreboard players add model_id local.tmp {(index * self.prop('material_len', 1))}",
                    "execute store result entity @s item.tag.CustomModelData int 1 run scoreboard players get model_id local.tmp",
                    "$execute at @s run tp @s ~ ~ ~ ~$(rotation) ~",
                    "execute as @s[tag=--local.uses.blockstate_callback] run function [namespace]:block/[unit_name]/blockstates/callback",
                ],
            )

            model_name = tree.default_format(ctx, self.format)(
                f"[namespace]:block/[unit_name]/template/{state.name}"
            )
            default_name = tree.default_format(ctx, self.format)(
                f"[namespace]:block/[unit_name]/{state.name}"
            )
            default_model_name = tree.default_format(ctx, self.format)(
                f"[namespace]:[unit]/[unit_name]/{state.name}/default"
            )

            if self.prop("material_len", 0) > 0:
                for material in cast(
                    list[BlockData.Material], self.prop("materials", [])
                ):
                    ctx.assets.models[f"{default_name}/{material.name}"] = (
                        ctx.assets.models[model_name]
                    )
                    ctx.assets.models[f"{default_name}/{material.name}"] = Model(
                        {
                            "parent": default_model_name,
                            "textures": json.loads(
                                json.dumps(ctx.assets.models[model_name].data)
                                .replace("/primary", f"/{material.primary_texture}")
                                .replace("/secondary", f"/{material.secondary_texture}")
                                .replace("/material", f"/{material.name}")
                            ).get("textures"),
                        }
                    )
                ctx.assets.models[default_model_name] = ctx.assets.models[model_name]
                ctx.assets.models.pop(model_name)
                continue

            ctx.assets.models[default_name] = ctx.assets.models[model_name]
            ctx.assets.models.pop(model_name)

        return self
