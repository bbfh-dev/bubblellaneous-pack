import json
from typing import Any, Optional, Self

from beet import Context, Function, LootTable
from beet.core.utils import snake_case
from colorama import Fore

from plugins.bubblellaneous.internal.template.loot import LOOT_TEMPLATE
from plugins.bubblellaneous.internal.template.mcfunction import (
    GIVE_TEMPLATE,
    SPAWN_TEMPLATE,
)
from plugins.bubblellaneous.internal.tree import Tree
from plugins.utils.nbt import NBT


def format_docs_line(lines: list) -> str:
    for i, line in enumerate(lines):
        line = line[4:]
        if line.startswith(":"):
            color = line.split(" ")[0][1:]
            text = " ".join(line.split(" ")[1:])[1:-1]
            lines[i] = NBT({"text": f"[{text}]\\n", "color": color}, is_json=True)
        else:
            lines[i] = f"{line}\\n"
    return NBT(["\\n", *lines]).get_list()


class Base:
    def __repr__(self) -> str:
        return "<{} #{}-{} ({})>".format(
            Fore.MAGENTA + self.name + Fore.RESET,
            self.unit_id,
            self.unit_id + self.allocate_ids() - 1,
            Fore.CYAN + str(self.allocate_ids()) + Fore.RESET,
        )

    def __init__(self) -> None:
        self.unit_id = 0
        self.properties: dict[str, Any] = {}
        self.category = "unknown"

    def prop(self, key: str, default: Any = None) -> Any:
        return self.properties.get(key, default)

    @property
    def name(self) -> str:
        return snake_case(self.__class__.__name__)

    @property
    def custom_model_data(self) -> int:
        return 371000 + self.unit_id

    @property
    def display_name(self) -> NBT.Quote:
        return NBT.Quote(
            NBT(
                {"translate": "[unit].[namespace].[name]", "italic": False},
                is_json=True,
            ).get_dict()
        )

    @property
    def unit_tag(self) -> dict:
        return {}

    @property
    def tag(self) -> str:
        return NBT(
            {
                "CustomModelData": self.custom_model_data,
                "display": {"Name": self.display_name},
                **self.unit_tag,
            }
        ).get_dict()

    @property
    def path(self) -> str:
        return f"[namespace]:[unit]/{'/'.join(self.prop('path'))}"

    def set_properties(self, **kwargs: Any) -> Self:
        self.properties = kwargs
        return self

    def read_property(self, key: str, default: Any) -> Any:
        keys = key.split(".")
        value = dict(self.__class__.__dict__)
        for key in keys:
            if type(value) is dict:
                value = value.get(key)
            else:
                value = getattr(value, key)
            if value is None:
                break
        if value is None:
            return default
        return value

    def add_model(
        self,
        tree: Tree,
        ctx: Context,
        custom_model_data: int,
        block_state: Optional[str],
    ):
        if block_state is None:
            tree.models[tree.default_format(ctx, self.format)(self.path)] = Tree.Model(
                custom_model_data, self.prop("base_item")
            )
            return
        tree.models[
            tree.default_format(ctx, self.format)(self.path + "/" + block_state)
        ] = Tree.Model(custom_model_data, self.prop("base_item"))

    def format(self, string: str) -> str:
        return (
            string.replace("[tag]", self.tag.replace('"', '\\\\"'))
            .replace("[name]", self.name)
            .replace("[unit]", self.prop("unit", default="unknown"))
            .replace("[base_item]", self.prop("base_item", "minecraft:structure_void"))
        )

    def get_documentation(self) -> str:
        if self.__class__.__doc__ is None:
            return "[]"
        return format_docs_line(self.__class__.__doc__.split("\n")[1:-1])

    def allocate_ids(self) -> int:
        return 1

    def prepare(self) -> Self:
        return self

    def compile(self, ctx: Context, unit_id: int, tree: Tree) -> Self:
        self.unit_id = unit_id
        self.prepare()

        tree.make_function(
            tree.default_format(ctx, self.format),
            "give:[namespace]/[name]",
            GIVE_TEMPLATE,
        )
        tree.make_function(
            tree.default_format(ctx, self.format),
            "spawn:[namespace]/[name]",
            SPAWN_TEMPLATE,
        )
        tree.make_function(
            tree.default_format(ctx, self.format),
            "help:[namespace]/[name]",
            ["tellraw @s {}".format(self.get_documentation())],
        )
        tree.make_loot_table(
            tree.default_format(ctx, self.format),
            "[namespace]:[unit]/[name]",
            LOOT_TEMPLATE.get_dict(),
        )

        if not self.prop("blockstates"):
            self.add_model(tree, ctx, self.custom_model_data, None)

        return self
