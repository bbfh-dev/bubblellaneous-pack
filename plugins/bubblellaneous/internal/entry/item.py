from dataclasses import dataclass
from enum import Enum
from typing import Literal, Self

from beet import Context
from caseconverter import snakecase

from plugins.utils.nbt import NBT

from ..bench_registry import BenchRegistry
from ..tree import Tree
from .base import BaseEntry


class Item(BaseEntry):
    class Base(Enum):
        CARROT_ON_A_STICK = "carrot_on_a_stick"

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
            for material, item in materials:
                name = name.replace(f"[{material}]", item)
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
                "material": "none",
                "material_count": 1,
                "index": 0,
                "docs": self.get_docs(),
                "base_item": f"minecraft:{self.__class__.__dict__['base'].value}",
                "tags": [],
                "sound": "",
                "display_name": NBT(
                    {"translate": "item.[namespace].[name]", "italic": False},
                    is_json=True,
                ),
                "class": "item",
                "path": [name],
                **{
                    name: self.__class__.__dict__.get(name)
                    for name in [
                        "category",
                        "recipe",
                        "params",
                        "base",
                    ]
                },
            }
        )
        return self

    def compile(self, tree: Tree, id: int) -> tuple[Tree, int]:
        self._props["data"] = lambda id: {
            "item_data": {
                "id": NBT.Quote(
                    self.prop("id"),
                    double=True,
                ),
                "name": NBT.Quote(
                    self.prop("name"),
                    double=True,
                ),
                "base": NBT.Quote(
                    self.prop("base").value,
                    double=True,
                ),
                "display_name": NBT.Quote(
                    self.prop("display_name"),
                ),
                "custom_model_data": self.get_id(id),
                "params": self.prop("params")(self.prop("material"), self.prop("index")),
            }
        }
        tree, id = super().compile(tree, id)
        if self.prop("is_single"):
            tree.add_model_id(f"[namespace]:item/{self.prop('name')}", self.get_id(id), self.prop("base").value)
        if self.prop("is_single"):
            self.make_function(
                tree, "help:[namespace]/[name]", f"tellraw @s {self.prop('docs')}"
            )
            self.make_function(
                tree,
                "[namespace]:recipe/item/[name]",
                "data modify storage bubblellaneous tmp.recipe set value {}".format(
                    NBT(
                        [recipe.get_entry([]) for recipe in self.prop("recipe")]
                    ).get_list()
                ),
            )
            tree.add_registry_item(
                self.prop("category"),
                BenchRegistry(f"item/{self.prop('name')}", self.prop("base").value, []),
            )
        return tree, id + 1
