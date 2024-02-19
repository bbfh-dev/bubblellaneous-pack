import math
from dataclasses import dataclass
from enum import Enum
from typing import Literal, Optional, Self

from beet import Context
from caseconverter import snakecase

from plugins.utils.nbt import NBT

from ..bench_registry import BenchRegistry
from ..tree import Tree
from .base import BaseEntry


class Block(BaseEntry):
    class Sound(Enum):
        INDUSTRIAL = "block.industrial"
        STONE = "block.stone"
        WOOD = "block.wood"
        WOOL = "block.wool"

    class Size(Enum):
        SINGLE = "--local.size.single"
        TALL = "--local.size.tall"
        WIDE = "--local.size.wide"

    class Base(Enum):
        CONTAINER = "barrel[facing=up]"
        SOLID = "petrified_oak_slab[type=double]"
        TOP_SLAB = "petrified_oak_slab[type=top]"
        BOTTOM_SLAB = "petrified_oak_slab[type=bottom]"
        FENCE = "dark_oak_fence"
        TRIPWIRE = "tripwire"
        VOID = "structure_void"

    class Facing(Enum):
        PLAYER = "player"
        WALL = "wall"
        NONE = "none"

    class Uses(Enum):
        TICK = "--local.uses.tick"
        GUI = "--local.uses.gui"
        CUSTOM_PLACE = "--local.uses.custom_place"
        BLOCKSTATES = "--local.uses.blockstates"

    @dataclass
    class Predicate:
        names: list[str | Literal["self"]]
        front: Optional[bool]
        back: Optional[bool]
        left: Optional[bool]
        right: Optional[bool]
        use_self: bool
        up: Optional[bool] = None
        down: Optional[bool] = None

        def format(self, block: str) -> str:
            statement = "unless" if block.startswith("!") else "if"
            not_statement = "if" if block.startswith("!") else "unless"
            block = block.replace("!", "")
            if block.startswith("@"):
                argument = (
                    f"entity @e[type=item_display,tag={block[1:]},distance=..0.5]"
                )
            elif block.startswith("#"):
                argument = f"block ~ ~ ~ #bubblellaneous:{block[1:]}"
            else:
                argument = f"block ~ ~ ~ {block}"

            args = []

            def add_arg(var: bool | None, offset: tuple[float, float, float]):
                args.append(
                    f"positioned ^{offset[0] or ''} ^{offset[1] or ''} ^{offset[2] or ''} {statement if var else not_statement} {argument} positioned ^{-offset[0]} ^{-offset[1]} ^{-offset[2]}"
                )

            if self.front is not None:
                add_arg(self.front, (0, 0, 1))
            if self.back is not None:
                add_arg(self.back, (0, 0, -1))
            if self.left is not None:
                add_arg(self.left, (-1, 0, 0))
            if self.right is not None:
                add_arg(self.right, (1, 0, 0))
            if self.up is not None:
                add_arg(self.up, (0, 1, 0))
            if self.down is not None:
                add_arg(self.down, (0, -1, 0))

            return " ".join(args)

    class State:
        def __init__(self, name: str, *predicates: Optional["Block.Predicate"]) -> None:
            self.name = name
            self.predicates = predicates

    @dataclass
    class RecipeItem:
        name: str
        group: Literal["block"] | Literal["item"] | Literal["tag"]
        count: int = 1

        def get_entry(self, materials: list[tuple[str, str]]):
            return {
                "id": self.get_name(materials),
                "group": self.group,
                "count": self.count,
                "lore": self.get_lore(materials),
            }

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

    def __init__(self, ctx: Context) -> None:
        super().__init__(ctx)

    def setup(self) -> Self:
        name = snakecase(self.__class__.__name__)
        self.set_properties(
            {
                "id": snakecase(self.__class__.__name__),
                "name": name,
                "size": 1,
                "is_single": True,
                "docs": self.get_docs(),
                "display_name": NBT(
                    {"translate": "block.[namespace].[name]", "italic": False},
                    is_json=True,
                ),
                "path": [name],
                **{
                    name: self.__class__.__dict__.get(name)
                    for name in [
                        "category",
                        "sound",
                        "base",
                        "facing",
                        "recipe",
                        "tags",
                        "blockstates",
                    ]
                },
            }
        )
        return self

    def compile(self, tree: Tree, id: int) -> tuple[Tree, int]:
        tree, id = super().compile(tree, id)
        tree.add_model_id(f"[namespace]:block/{self.prop('name')}", self.get_id(id))
        self.make_function(
            tree,
            "place:[namespace]/[name]",
            "function spawn:[namespace]/[name]",
            ":as @e[type=item,nbt={Age: 0s},:first] align xyz -> [namespace]:utils/block/place",
        )
        if self.prop("is_single"):
            self.make_function(
                tree, "help:[namespace]/[name]", f"tellraw @s {self.prop('docs')}"
            )
            self.make_function(
                tree,
                "[namespace]:recipe/block/[name]",
                "data modify storage bubblellaneous tmp.recipe set value {}".format(
                    NBT(
                        [recipe.get_entry([]) for recipe in self.prop("recipe")]
                    ).get_list()
                ),
            )
            tree.add_registry_item(
                self.prop("category"),
                BenchRegistry(f"block/{self.prop('name')}", []),
            )
        return tree, id + 1
