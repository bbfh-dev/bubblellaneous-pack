import json
from typing import Optional

from beet import Function, Model
from caseconverter import snakecase

from plugins.bubblellaneous.internal.entry.item import Item
from plugins.utils.nbt import NBT

from ..bench_registry import BenchRegistry
from ..tree import Tree
from .base import BaseEntry
from .block_group import WOOL_COLORS


class ItemGroup(BaseEntry):
    COLOR_TYPE = [
        (
            color,
            {"color": f"{color}_dye"},
        )
        for color in WOOL_COLORS
    ]

    def compile_single(
        self,
        tree: Tree,
        id: int,
        material: str,
        state: Optional[str],
        item_materials: dict[str, str],
        index: int,
    ):
        item = Item(self.ctx)
        item_name = snakecase(self.__class__.__name__)
        name = "_".join([material, item_name])
        path = [item_name, *[i for i in [state] if i], material]
        item.set_properties(
            {
                "id": item_name,
                "name": name,
                "is_single": False,
                "material": material,
                "index": index,
                "base_item": f"minecraft:{self.__class__.__dict__['base'].value}",
                "tags": [],
                "docs": self.get_docs(),
                "display_name": NBT(
                    {
                        "translate": f"item.[namespace].{material.split('_')[-1]}_{item_name}",
                        "italic": False,
                    },
                    is_json=True,
                ),
                "class": "item",
                "path": path,
                **{
                    name: self.__class__.__dict__.get(name)
                    for name in [
                        "category",
                        "base",
                        "params",
                        "recipe",
                    ]
                },
            }
        )
        tree.add_model_id(f"[namespace]:item/{'/'.join(path)}", self.get_id(id), item.prop("base").value)
        tree.functions[f"help:[namespace]/{item_name}"] = Function(
            "\n".join([f"tellraw @s {item.prop('docs')}"])
        )
        if item.prop("recipe"):
            item.make_function(
                tree,
                "[namespace]:recipe/item/[name]",
                "data modify storage bubblellaneous tmp.recipe set value {}".format(
                    NBT(
                        [
                            recipe.get_entry(
                                [(key, value) for key, value in item_materials.items()]
                            )
                            for recipe in item.prop("recipe")
                        ]
                    ).get_list()
                ),
            )
        tree, _ = item.compile(tree, id)
        id += 1

    def compile(self, tree: Tree, id: int) -> tuple[Tree, int]:
        materials = self.__class__.__dict__["materials"]
        name = snakecase(self.__class__.__name__)

        tree.add_registry_item(
            self.__class__.__dict__["category"],
            BenchRegistry(
                f"item/{materials[0][0]}_{name}",
                self.__class__.__dict__["base"].value,
                [f"item/{material[0]}_{name}" for material in materials],
            ),
        )

        for index, (material, item_materials) in enumerate(materials):
            template = self.ctx.assets.models[f"{self.ctx.project_id}:item/{name}"]
            tree.model(
                f"{self.ctx.project_id}:item/{name}/{material}",
                Model(
                    json.loads(
                        json.dumps(template.data).replace("/material", f"/{material}")
                    )
                ),
            )
            self.compile_single(tree, id, material, None, item_materials, index)
            id += 1
        self.ctx.assets.models.pop(f"{self.ctx.project_id}:item/{name}")
        return tree, id + 1
