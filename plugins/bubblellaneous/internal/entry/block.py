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

    class Predicate:
        def __init__(
            self,
            offset: (
                Literal["FRONT"] | Literal["BACK"] | Literal["LEFT"] | Literal["RIGHT"]
            ),
            *blocks: Optional["Block"] | Literal["self"] | Literal["#solid"],
        ) -> None:
            self.blocks = blocks
            self.offset = offset

    class State:
        def __init__(self, name: str, predicates: list["Block.Predicate"]) -> None:
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
                "is_single": True,
                "docs": self.get_docs(),
                "display_name": NBT(
                    {"translate": "block.[namespace].[name]", "italic": False},
                    is_json=True,
                ),
                "path": [name],
                **{
                    name: self.__class__.__dict__[name]
                    for name in [
                        "category",
                        "sound",
                        "base",
                        "facing",
                        "recipe",
                        "tags",
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
