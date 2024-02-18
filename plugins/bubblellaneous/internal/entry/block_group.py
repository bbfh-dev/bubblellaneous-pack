import json
from itertools import product
from typing import Optional

from beet import Function, Model
from caseconverter import snakecase

from plugins.utils.nbt import NBT

from ..bench_registry import BenchRegistry
from ..tree import Tree
from .base import BaseEntry
from .block import Block

WOOL_COLORS = [
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


class BlockGroup(BaseEntry):
    WOOD_TYPE = [
        ("oak", "oak_planks", "oak_log"),
        ("spruce", "spruce_planks", "spruce_log"),
        ("birch", "birch_planks", "birch_log"),
        ("jungle", "jungle_planks", "jungle_log"),
        ("acacia", "acacia_planks", "acacia_log"),
        ("dark_oak", "dark_oak_planks", "dark_oak_log"),
        ("mangrove", "mangrove_planks", "mangrove_log"),
        ("cherry", "cherry_planks", "cherry_log"),
        ("crimson", "crimson_planks", "crimson_stem"),
        ("warped", "warped_planks", "crimson_stem"),
    ]

    WOOL_TYPE = [
        (
            color,
            f"{color}_wool",
            f"{color}_terracotta",
        )
        for color in WOOL_COLORS
    ]

    FURNITURE_TYPE = [
        *WOOD_TYPE,
        ("stone", "stone", "smooth_stone"),
        ("quartz", "quartz_block_side", "quartz_pillar"),
    ]

    WOOD_WITH_WOOL_TYPE = [
        (f"{color[0]}_{wood[0]}", wood[1], color[1])
        for color, wood in product(WOOL_TYPE, WOOD_TYPE)
    ]

    def compile_single(self, tree: Tree, id: int, material: str, state: Optional[str]):
        block = Block(self.ctx)
        block_name = snakecase(self.__class__.__name__)
        name = "_".join([material, block_name])
        path = [block_name, *[i for i in [state] if i], material]
        tree.add_model_id(f"[namespace]:block/{'/'.join(path)}", self.get_id(id))
        block.set_properties(
            {
                "id": block_name,
                "name": name,
                "is_single": False,
                "docs": self.get_docs(),
                "display_name": NBT(
                    {
                        "translate": f"block.[namespace].{material.split('_')[-1]}_{block_name}",
                        "italic": False,
                    },
                    is_json=True,
                ),
                "path": path,
                **{
                    name: self.__class__.__dict__[name]
                    for name in ["category", "sound", "base", "facing", "tags"]
                },
            }
        )
        tree.functions[f"help:[namespace]/{block_name}"] = Function(
            "\n".join([f"tellraw @s {block.prop('docs')}"])
        )
        tree, _ = block.compile(tree, id)
        id += 1

    def compile(self, tree: Tree, id: int) -> tuple[Tree, int]:
        blockstates = self.__class__.__dict__.get("blockstates")
        materials = self.__class__.__dict__["materials"]
        name = snakecase(self.__class__.__name__)

        tree.add_registry_item(
            self.__class__.__dict__["category"],
            BenchRegistry(
                f"block/{materials[0][0]}_{name}",
                [f"block/{material[0]}_{name}" for material in materials],
            ),
        )

        if not blockstates:
            for material, primary, secondary in materials:
                template = self.ctx.assets.models[f"{self.ctx.project_id}:block/{name}"]
                tree.model(
                    f"{self.ctx.project_id}:block/{name}/{material}",
                    Model(
                        json.loads(
                            json.dumps(template.data)
                            .replace("template/primary", f"block/{primary}")
                            .replace("template/secondary", f"block/{secondary}")
                        )
                    ),
                )
                self.compile_single(tree, id, material, None)
                id += 1
            self.ctx.assets.models.pop(f"{self.ctx.project_id}:block/{name}")
            return tree, id + 1

        first = blockstates[0].name
        dir = f"{self.ctx.project_id}:block/{name}"
        for state in blockstates:
            template = self.ctx.assets.models[f"{dir}/template/{state.name}"]
            for material, primary, secondary in materials:
                tree.model(
                    f"{dir}/{state.name}/{material}",
                    Model(
                        json.loads(
                            json.dumps(template.data)
                            .replace("template/primary", f"block/{primary}")
                            .replace("template/secondary", f"block/{secondary}")
                        )
                    ),
                )
                if state.name == first:
                    self.compile_single(tree, id, material, state.name)
                id += 1

        return tree, id + 1
