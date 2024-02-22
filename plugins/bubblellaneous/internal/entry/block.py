import json
from dataclasses import dataclass
from enum import Enum
from typing import Literal, Optional, Self

from beet import Context, Model
from caseconverter import snakecase

from plugins.utils.nbt import NBT

from ..bench_registry import BenchRegistry
from ..tree import Tree
from .base import BaseEntry


def get_blockstate_code(
    predicates: str,
    name: str,
    state: "Block.State",
    predicate: Optional["Block.Predicate"],
):
    macro = "{rotate: $VAL}".replace(
        "$VAL", str(0 if not predicate else (predicate.rotation or 0))
    )
    if predicates:
        if "@" in predicates:
            macro = macro.replace("connection: 1", "connection: 2")
        line = f"execute {predicates} run function [namespace]:blocks/{name}/blockstate/set_{state.name} {macro}"
    else:
        line = f"function [namespace]:blocks/{name}/blockstate/set_{state.name} {macro}"

    return "\n".join(
        [
            line,
            "execute if score quit local.tmp matches 1 run return 0",
            "",
        ]
    )


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
        HOPPER = "hopper"
        SOLID = "petrified_oak_slab[type=double]"
        TOP_SLAB = "petrified_oak_slab[type=top]"
        BOTTOM_SLAB = "petrified_oak_slab[type=bottom]"
        CHAIN = "chain"
        TRIPWIRE = "tripwire"
        VOID = "structure_void"

    class Facing(Enum):
        PLAYER = "player"
        WALL = "wall"
        SURFACE = "surface"
        DOOR = "door"
        NONE = "none"

    class Uses(Enum):
        TICK = "--local.uses.tick"
        GUI = "--local.uses.gui"
        CUSTOM_PLACE = "--local.uses.custom_place"
        BLOCKSTATES = "--local.uses.blockstates"
        NO_BASE = "--local.uses.no_base"
        CUSTOM_BASE = "--local.uses.custom_base"
        BRIGHTNESS_FIX = "--local.uses.brightness_fix"
        ALL_DIMENSIONS = "--local.uses.all_dimensions"

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
        rotation: Optional[int] = None

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
                "is_single": True,
                "base_item": "minecraft:item_frame",
                "material_count": 1,
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
        self._props["data"] = lambda id: {
            "EntityTag": {
                "Tags": [
                    f"+[namespace]",
                    "local.place",
                    *[i.value for i in self.prop("tags")],
                ],
                "Invisible": True,
                "Fixed": True,
                "Invulnerable": True,
                "Silent": True,
                "Item": {
                    "id": "stone_button",
                    "Count": True,
                    "tag": {
                        "block_data": {
                            "id": NBT.Quote(
                                self.prop("id"),
                                double=True,
                            ),
                            "name": NBT.Quote(
                                self.prop("name"),
                                double=True,
                            ),
                            "sound": NBT.Quote(
                                self.prop("sound").value,
                                double=True,
                            ),
                            "base": NBT.Quote(
                                self.prop("base").value,
                                double=True,
                            ),
                            "display_name": NBT.Quote(
                                self.prop("display_name"),
                            ),
                            "facing": NBT.Quote(
                                self.prop("facing").value,
                                double=True,
                            ),
                            "material_count": self.prop("material_count"),
                            "custom_model_data": self.get_id(id),
                        }
                    },
                },
            },
        }
        tree, id = super().compile(tree, id)
        if not (self.prop("is_single") and type(self.prop("blockstates")) is list):
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
                BenchRegistry(f"block/{self.prop('name')}", "item_frame", []),
            )
            if type(self.prop("blockstates")) is list:
                blockstates: list[Block.State] = self.prop("blockstates")
                dir = f"{self.ctx.project_id}:block/{self.prop('name')}"
                for state in blockstates:
                    template = self.ctx.assets.models[f"{dir}/template/{state.name}"]
                    tree.model(
                        f"{dir}/{state.name}",
                        Model(json.loads(json.dumps(template.data))),
                    )
                    tree.add_model_id(
                        f"[namespace]:block/{'/'.join([self.prop('name'), state.name])}",
                        self.get_id(id),
                    )
                    id += 1

                code: list[str] = ["scoreboard players set quit local.tmp 0", ""]
                for i, state in enumerate(blockstates):
                    for predicate in state.predicates:
                        if predicate is None:
                            code.append(
                                get_blockstate_code("", self.prop("name"), state, None)
                            )
                            continue
                        names = predicate.names
                        if predicate.use_self:
                            names.append(f"@--local.name.{self.prop('name')}")
                        for block_name in names:
                            code.insert(
                                2,
                                get_blockstate_code(
                                    predicate.format(block_name),
                                    self.prop("name"),
                                    state,
                                    predicate,
                                ),
                            )
                    self.make_function(
                        tree,
                        f"[namespace]:blocks/{self.prop('name')}/blockstate/set_{state.name}",
                        "scoreboard players set quit local.tmp 1",
                        "execute store result score model local.tmp run data get entity @s item.tag.block_data.custom_model_data",
                        f"scoreboard players add model local.tmp {i}",
                        f"scoreboard players set @s local.block.model {i}",
                        "execute store result entity @s item.tag.CustomModelData int 1 run scoreboard players get model local.tmp",
                        "$execute as @s[tag=--local.uses.all_dimensions] at @s run tp @s ~ ~ ~ $(rotate) 0",
                        "$scoreboard players set rotation local.tmp $(rotate)",
                        f"function [namespace]:blocks/{self.prop('name')}/blockstate/post_update",
                    )
                if Block.Uses.ALL_DIMENSIONS in self.prop("tags"):
                    code.insert(
                        2,
                        "\n".join(
                            [
                                "tp @s ~ ~ ~ ~ ~",
                                "",
                            ]
                        ),
                    )
                self.make_function(
                    tree,
                    f"[namespace]:blocks/{self.prop('name')}/blockstate/update",
                    *code,
                )
        return tree, id + 1
