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


class BlockData:
    class Base(Enum):
        NONE = "air"
        CONTAINER = "barrel[facing=up]"
        HOPPER = "hopper"
        UPPER = "petrified_oak_slab[type=top]"
        LOWER = "petrified_oak_slab[type=bottom]"
        SOLID = "petrified_oak_slab[type=double]"
        TRIPWIRE = "tripwire"
        CHAIN = "chain[axis=y]"
        VOID = "structure_void"

    class Sound(Enum):
        INDUSTRIAL = "industrial"
        WOOD = "wood"
        SOFT = "soft"

    class Facing(Enum):
        NONE = "none"
        PLAYER = "player"
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
            return f"[namespace]:block/[name]/blockstates/apply/{self.name}"

        def get_line(self, line: str, path: str) -> str:
            return "\n".join(
                [
                    "execute "
                    + " ".join(
                        [
                            line.replace("[coords]", direction.coords).replace(
                                "[-coords]", direction.negative_coords
                            )
                            for i, direction in enumerate(DIRECTIONS)
                            if predicate[i] != "~"
                        ]
                    )
                    + f" run function {path}"
                    for predicate in self.predicates
                ]
                + ["execute if score quit local.tmp matches 1 run return 0"]
            )

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
                return "@e[type=item_frame,tag=local.named.[name],distance=..0.5]"
            return self.absolute_match

        @property
        def block_tag(self) -> str:
            return self.absolute_match

        @property
        def predicate(self) -> str:
            condition = "if" if not self.match.startswith("!") else "unless"
            if self.absolute_match.startswith("@"):
                return f"positioned [coords] {condition} entity {self.entity} positioned [-coords]"
            return f"{condition} block [coords] {self.block_tag}"


class BlockType:
    @classmethod
    def shelf(cls, *, amount: int):
        return BlockType()

    @classmethod
    def seat(cls, *, width: float, height: float):
        return BlockType()

    @classmethod
    def light(cls, *, light_level: int):
        return BlockType()

    def __init__(self) -> None:
        pass


class Block(Base):
    @override
    def allocate_ids(self) -> int:
        return max(len(self.read_property("blockstates.block_states", [])), 1)

    def __init__(self, category: Category) -> None:
        super().__init__()
        self.category = category.value

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
                                    for key in ["id", "name", "base_item", "unit"]
                                },
                                **{
                                    enum: self.prop(enum).value
                                    for enum in ["base", "sound", "facing"]
                                },
                                "custom_model_data": self.custom_model_data,
                                "display_name": self.display_name,
                            },
                        }
                    },
                },
            },
        }

    @override
    def prepare(self) -> Self:
        return self.set_properties(
            name=self.name,
            base_item="minecraft:item_frame",
            unit="block",
            path=[self.name],
            **{
                key: self.read_property(key, None)
                for key in ["base", "sound", "facing", "recipe", "tags", "blockstates"]
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

        if blockstates.match != "<manual>":
            tree.make_function(
                tree.default_format(ctx, self.format),
                "[namespace]:block/[name]/blockstates/update",
                [
                    "scoreboard players set quit local.tmp 0",
                    "",
                    "\n\n".join(
                        [
                            state.get_line(blockstates.predicate, state.path)
                            for state in blockstates.block_states
                            if state.name != "default"
                        ]
                    ),
                    "",
                    f"function {blockstates.block_states[0].path}",
                ],
            )
        print(blockstates)

        for index, state in enumerate(blockstates.block_states):
            self.add_model(tree, ctx, self.custom_model_data + index, state.name)
            tree.make_function(
                tree.default_format(ctx, self.format),
                state.path,
                [
                    "scoreboard players set quit local.tmp 1",
                    "",
                    f"scoreboard players set @s local.block_state {index}",
                    f"data modify entity @s item.tag.CustomModelData set value {self.custom_model_data + index}",
                ],
            )

        return self
