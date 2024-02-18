import re
from typing import Self

from beet import Context, Function, LootTable

from plugins.utils.nbt import NBT

from ..templates import use_template
from ..tree import Tree


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


class BaseEntry:
    def __init__(self, ctx: Context) -> None:
        self.ctx = ctx
        self._props = {}

    def set_properties(self, props: dict):
        self._props = props

    def prop(self, key: str):
        return self._props.get(key, "<none>")

    def get_id(self, id: int):
        if id < 1000:
            return int(f"371{id:0>3}")
        return int(f"37{id+1000:0>4}")

    def get_docs(self) -> str:
        if self.__class__.__doc__ is None:
            return "[]"
        return format_docs_line(self.__class__.__doc__.split("\n")[1:-1])

    def format(self, key: str) -> str:
        return re.sub(
            r"^\:",
            "execute ",
            key.replace("[name]", self.prop("name"))
            .replace(
                "[class]",
                re.sub(r"s$", "", self.__class__.__dict__["__module__"].split(".")[-1]),
            )
            .replace(":first", "limit=1,sort=nearest")
            .replace("->", "run function"),
        )

    def make_function(self, tree: Tree, key: str, *lines, **kwargs):
        return tree.function(
            self.format(key),
            Function(
                "\n".join(
                    [
                        self.format(i)
                        for i in ["#! Generated using beet/bubblellaneous", *lines]
                    ]
                ),
                **kwargs,
            ),
        )

    def make_loot_table(self, tree: Tree, key: str, data: NBT):
        return tree.loot_table(
            self.format(key),
            LootTable(
                self.format(data.get_dict()),
            ),
        )

    def setup(self) -> Self:
        return self

    def compile(self, tree: Tree, id: int) -> tuple[Tree, int]:
        self.make_function(
            tree,
            f"give:[namespace]/[name]",
            "loot give @s loot [namespace]:[class]/[name]",
        )
        self.make_function(
            tree,
            f"spawn:[namespace]/[name]",
            "loot spawn ~ ~ ~ loot [namespace]:[class]/[name]",
        )
        self.make_loot_table(
            tree,
            f"[namespace]:[class]/[name]",
            use_template(
                "give.json",
                {
                    "nbt": NBT.Quote(
                        NBT(
                            {
                                "CustomModelData": self.get_id(id),
                                "display": {
                                    "Name": NBT.Quote(self.prop("display_name"))
                                },
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
                                                "custom_model_data": self.get_id(id),
                                            }
                                        },
                                    },
                                },
                            }
                        ).get_dict(),
                        double=True,
                    )
                },
            ),
        )
        return tree, id
