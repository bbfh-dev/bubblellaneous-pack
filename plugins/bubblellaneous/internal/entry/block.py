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

    def __init__(self, ctx: Context) -> None:
        super().__init__(ctx)

    def setup(self) -> Self:
        name = snakecase(self.__class__.__name__)
        self.set_properties(
            {
                "id": snakecase(self.__class__.__name__),
                "name": name,
                "is_single": True,
                "display_name": NBT(
                    {"translate": "block.[namespace].[name]", "italic": False},
                    is_json=True,
                ),
                "path": [name],
                **{
                    name: self.__class__.__dict__[name]
                    for name in ["category", "sound", "base", "facing", "tags"]
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
            tree.add_registry_item(BenchRegistry(f"block/{self.prop('name')}", []))
        return tree, id + 1
