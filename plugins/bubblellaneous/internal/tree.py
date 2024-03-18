import json
from dataclasses import dataclass
from typing import Callable, Self

from beet import Advancement, Context, Function, ItemModifier, LootTable, Model

from plugins.bubblellaneous.internal.category import Category
from plugins.bubblellaneous.internal.template.items import ITEMS_TEMPLATE
from plugins.bubblellaneous.internal.template.mcfunction import BENCH_TEMPLATE
from plugins.bubblellaneous.internal.unit.const.materials import COLORS, SOLIDS
from plugins.utils import NBT


@dataclass
class BenchRegistry:
    entry: str
    item: str
    items: list
    count: int = 0

    def update(self):
        self.count = max(min(len(self.items), 64), 1)
        return self

    def add_item(self, item: str) -> Self:
        self.items.append(item)
        self.update()
        return self

    def get_dict(self, index: int) -> dict:
        return {
            "entry": self.entry,
            "item": self.item,
            "count": self.count,
            "items": sorted(self.items, key=sort_bench_registry),
            "index": index,
        }


def sort_bench_registry(key: BenchRegistry | str):
    if type(key) is BenchRegistry:
        unit, name = key.item.split("/")
    else:
        unit, name = str(key).split("/")

    weights = [0, 0]

    materials = [(i, x) for i, x in enumerate(SOLIDS)]
    for i, block in sorted(materials, key=lambda i: len(i[1]), reverse=True):
        if block not in name:
            continue
        weights[0] = i
        break

    materials = [(i, x) for i, x in enumerate(SOLIDS)]
    for i, color in sorted(materials, key=lambda i: len(i[1]), reverse=True):
        if color not in name:
            continue
        weights[1] = i
        break

    return unit, *weights


@dataclass(init=False)
class Tree:
    @dataclass
    class Model:
        custom_model_data: int
        base_item: str

        @property
        def item_name(self) -> str:
            return self.base_item.split(":")[-1]

    @dataclass
    class MergedModel:
        model: "Tree.Model"
        path: str

    functions: dict[str, Function]
    loot_tables: dict[str, LootTable]
    advancements: dict[str, Advancement]
    item_modifiers: dict[str, ItemModifier]
    bench_registry: dict[str, list[BenchRegistry]]
    state_registry: dict
    models: dict[str, Model]

    def __init__(self) -> None:
        self.functions = {}
        self.loot_tables = {}
        self.advancements = {}
        self.item_modifiers = {}
        self.bench_registry = {}
        self.state_registry = {}
        self.models = {}

    def default_format(self, ctx: Context, fn: Callable) -> Callable:
        def format(string: str):
            return fn(string).replace("[namespace]", ctx.project_id)

        return format

    def make_function(
        self,
        format: Callable,
        key: str,
        lines: list[str],
        tags: list[str] = [],
    ):
        key = format(key)
        lines = [format(line) for line in lines]

        original = self.functions.get(key)
        if original is None:
            self.functions[key] = Function("\n".join(lines), tags=tags)
            return
        self.functions[key] = Function(
            "\n".join([*original.lines, *lines]), tags=[*(original.tags or []), *tags]
        )

    def make_loot_table(self, format: Callable, key: str, data: str):
        self.loot_tables[format(key)] = LootTable(json.loads(format(json.dumps(data))))

    def make_bench_registry(self, format: Callable, category: str, name: str, items: list):
        self.bench_registry[category] = [
            *self.bench_registry.get(category, []),
            BenchRegistry(name, format("[unit]/[name]"), items, len(items)),
        ]

    def make_state_registry(self, block: str, data: list):
        final = {}
        for subdata in data:
            for key, value in subdata.items():
                final[key] = value
        self.state_registry[block] = final

    def extend_bench_registry(
        self, format: Callable, category: str, name: str, item: str
    ):
        indexes = [
            i
            for i, entry in enumerate(self.bench_registry.get(category, []))
            if entry.entry == name
        ]
        if not indexes:
            self.make_bench_registry(format, category, name, [])
            return self.extend_bench_registry(format, category, name, item)

        self.bench_registry[category][indexes[0]] = self.bench_registry[category][
            indexes[0]
        ].add_item(format(item))

    def bench_registry_format(self, string: str):
        for category in self.bench_registry.keys():
            string = string.replace(
                f"[{category}]",
                NBT(
                    [
                        entry.get_dict(i)
                        for i, entry in enumerate(
                            sorted(
                                self.bench_registry[category],
                                key=sort_bench_registry,
                            )
                        )
                    ]
                ).get_list(),
            )
        return string

    def add_bench_registry_function(self, ctx: Context):
        self.make_function(
            self.default_format(ctx, self.bench_registry_format),
            "[namespace]:generated/load_registry",
            BENCH_TEMPLATE,
            tags=[f"{ctx.project_id}:load"],
        )

    def _compile(self, ctx: Context, name: str):
        assert type(getattr(self, name)) is dict
        data = getattr(self, name)
        for key, value in data.items():
            getattr(getattr(ctx, "data"), name)[key] = value

    def compile(self, ctx: Context):
        self.make_function(
            self.default_format(ctx, self.bench_registry_format),
            "[namespace]:generated/load_blockstates",
            [
                f"data modify storage {ctx.project_id} state_registry set value {NBT(self.state_registry).get_dict().replace('\\', '')}"
            ],
            tags=[f"{ctx.project_id}:load"],
        )
        self.add_bench_registry_function(ctx)
        self._compile(ctx, "functions")
        self._compile(ctx, "loot_tables")
        self._compile(ctx, "advancements")
        self._compile(ctx, "item_modifiers")

        merged_models: dict[str, list[Tree.MergedModel]] = {}
        for path, model in self.models.items():
            merged_models[model.item_name] = [
                *merged_models.get(model.item_name, []),
                Tree.MergedModel(model, path),
            ]

        for name, models in merged_models.items():
            ctx.assets.models[f"minecraft:item/{name}"] = Model(
                {
                    **ITEMS_TEMPLATE.get(f"minecraft:{name}", {}),
                    "overrides": [
                        {
                            "predicate": {
                                "custom_model_data": model.model.custom_model_data
                            },
                            "model": model.path,
                        }
                        for model in sorted(
                            models,
                            key=lambda i: i.model.custom_model_data,
                            reverse=False,
                        )
                    ],
                }
            )
