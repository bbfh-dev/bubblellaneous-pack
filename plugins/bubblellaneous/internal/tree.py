import json

from beet import Context, Function, LootTable, Model
from colorama import Fore

from plugins.utils.nbt import NBT

from .bench_registry import BenchRegistry
from .category import Category
from .templates import use_template


class Tree:
    def __init__(self) -> None:
        self.functions: dict[str, Function] = {}
        self.loot_tables: dict[str, LootTable] = {}
        self.models: dict[str, Model] = {}
        self.model_ids: list[tuple[str, int, str]] = []
        self.bench_registry: dict[str, list[BenchRegistry]] = {}

    def __repr__(self) -> str:
        return self.__str__()

    def __str__(self) -> str:
        return "\n".join(
            [
                f"[{Fore.RED}󰡱 Functions{Fore.RESET}]:",
                *[
                    f"→ {Fore.BLUE}{k}{Fore.RESET}: {v}"
                    for k, v in self.functions.items()
                ],
                "",
                f"[{Fore.RED}󰓫 Loot Tables{Fore.RESET}]:",
                *[
                    f"→ {Fore.BLUE}{k}{Fore.RESET}: {v}"
                    for k, v in self.loot_tables.items()
                ],
            ]
        )

    def format(self, ctx: Context, key: str):
        return key.replace("[namespace]", ctx.project_id).replace(
            "local.", f'{ctx.meta["prefix"]}.'
        )

    def format_code(self, ctx: Context):
        functions, self.functions = self.functions, {}
        for key, item in functions.items():
            item.lines = [self.format(ctx, i) for i in item.lines]
            self.functions[self.format(ctx, key)] = item

        loot_tables, self.loot_tables = self.loot_tables, {}
        for key, item in loot_tables.items():
            item.data = json.loads(self.format(ctx, json.dumps(item.data)))
            self.loot_tables[self.format(ctx, key)] = item

        advancements = ctx.data.advancements
        for key, item in advancements.items():
            item.data = json.loads(self.format(ctx, json.dumps(item.data)))
            ctx.data.advancements[self.format(ctx, key)] = item

        for index, (path, id, item) in enumerate(self.model_ids):
            self.model_ids[index] = (self.format(ctx, path), id, item)
        self.model_ids.sort(key=lambda a: a[1], reverse=False)

        return self

    def dump(self, ctx: Context):
        for key, item in self.functions.items():
            ctx.data.functions[key] = item

        for key, item in self.loot_tables.items():
            ctx.data.loot_tables[key] = item

        to_be_deleted = []
        for key in ctx.assets.models.keys():
            if "template" in key:
                to_be_deleted.append(key)
        for key in to_be_deleted:
            ctx.assets.models.pop(key)

        for key, item in self.models.items():
            ctx.assets.models[key] = item

        for item_name in set([i[2] for i in self.model_ids]):
            ctx.assets.models[f"minecraft:item/{item_name}"] = Model(
                json.loads(
                    use_template(
                        f"{item_name}_overrides.json",
                        {
                            "overrides": NBT(
                                [
                                    {
                                        "predicate": {"custom_model_data": id},
                                        "model": model,
                                    }
                                    for model, id, item in self.model_ids
                                    if item == item_name
                                ],
                                is_json=True,
                            )
                        },
                    )
                    .get_dict()
                    .replace('\\"', '"')
                )
            )

        return self

    def function(self, key: str, fn: Function):
        original = self.functions.get(key)
        if original is not None:
            self.functions[key] = Function(
                "\n".join(
                    [
                        *original.lines,
                        *fn.lines,
                    ]
                ),
                tags=[*(original.tags or []), *(fn.tags or [])],
            )
        else:
            self.functions[key] = fn

    def loot_table(self, key: str, lt: LootTable):
        original = self.loot_tables.get(key)
        if original is not None:
            self.loot_tables[key] = LootTable(original.data | lt.data)
        else:
            self.loot_tables[key] = lt

    def model(self, key: str, model: Model):
        original = self.models.get(key)
        if original is not None:
            self.models[key] = Model(original.data | model.data)
        else:
            self.models[key] = model

    def add_model_id(self, key: str, id: int, item: str = "item_frame"):
        if id in [i[1] for i in self.model_ids]:
            return
        self.model_ids.append((key, id, item))

    def add_registry_item(self, category: Category, item: BenchRegistry):
        if not self.bench_registry.get(category.value):
            self.bench_registry[category.value] = []
        self.bench_registry[category.value].append(item.update())
