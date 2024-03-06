import json
from dataclasses import dataclass
from typing import Callable, Self

from beet import Advancement, Context, Function, ItemModifier, LootTable, Model

from plugins.bubblellaneous.internal.category import Category
from plugins.bubblellaneous.internal.template.items import ITEMS_TEMPLATE


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
    models: dict[str, Model]

    def __init__(self) -> None:
        self.functions = {}
        self.loot_tables = {}
        self.advancements = {}
        self.item_modifiers = {}
        self.bench_registry = {}
        self.models = {}

    def default_format(self, ctx: Context, fn: Callable) -> Callable:
        def format(string: str):
            return fn(string).replace("[namespace]", ctx.project_id)

        return format

    def make_function(
        self, format: Callable, key: str, lines: list[str], tags: list[str] = []
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

    def make_bench_registry(self, format: Callable, category: str, name: str):
        self.bench_registry[category] = [
            *self.bench_registry.get(category, []),
            BenchRegistry(name, format("[unit]/[name]"), []),
        ]

    def extend_bench_registry(
        self, format: Callable, category: str, name: str, item: str
    ):
        indexes = [
            i
            for i, entry in enumerate(self.bench_registry.get(category, []))
            if entry.entry == name
        ]
        if not indexes:
            self.make_bench_registry(format, category, name)
            return self.extend_bench_registry(format, category, name, item)

        self.bench_registry[category][indexes[0]] = self.bench_registry[category][
            indexes[0]
        ].add_item(format(item))

    def _compile(self, ctx: Context, name: str):
        assert type(getattr(self, name)) is dict
        data = getattr(self, name)
        for key, value in data.items():
            getattr(getattr(ctx, "data"), name)[key] = value

    def compile(self, ctx: Context):
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
