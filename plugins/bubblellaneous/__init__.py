from beet import Context, Function
from colorama import Fore, init

from plugins.utils.nbt import NBT

from .blocks import *
from .internal.entry import BaseEntry
from .internal.tree import Tree
from .items import *

REGISTRY: list[type[BaseEntry]] = [
    BubbleBench,
    Table,
    Shelf,
    Cabinet,
    Drawer,
    Cupboard,
    Bench,
    Couch,
    Stool,
    Barstool,
    DinningChair,
    Blinds,
    KitchenCabinet,
    Fridge,
    Washer,
    Trashcan,
    Ladder,
    PadlockBlock,
    Padlock,
    Key,
    RisingDoor,
    Pipe,
]


def beet_default(ctx: Context):
    init()
    tree = Tree()
    id = 1
    registry = []
    for item in REGISTRY:
        tree, id = item(ctx).setup().compile(tree, id)
        registry.append(item.__name__)
    tree.format_code(ctx).dump(ctx)

    ctx.data.functions[f"{ctx.project_id}:load_registry"] = Function(
        "\n".join(
            [
                "data modify storage {} bench_registry set value {}".format(
                    ctx.project_id, "{}"
                ),
                *[
                    "data modify storage {} bench_registry.{} set value {}".format(
                        ctx.project_id,
                        category.value,
                        NBT(
                            [
                                {
                                    "name": entry.entry,
                                    "type": entry.item,
                                    "items": entry.items,
                                    "count": entry.count,
                                    "index": i,
                                }
                                for i, entry in enumerate(
                                    tree.bench_registry.get(category.value, [])
                                )
                            ]
                        ).get_list(),
                    )
                    for category in (
                        Category.FURNITURE,
                        Category.TECHNOLOGY,
                        Category.FOOD,
                        Category.MISCELLANEOUS,
                    )
                ],
                *[
                    "\nexecute store result score registry.{}.pages local.var store result score registry.{}.size local.var run data get storage {} bench_registry.{}\n{}\n{}".format(
                        category.value,
                        category.value,
                        ctx.project_id,
                        category.value,
                        f"scoreboard players operation registry.{category.value}.pages local.var /= 18 local.int",
                        f"scoreboard players add registry.{category.value}.pages local.var 1",
                    )
                    for category in (
                        Category.FURNITURE,
                        Category.TECHNOLOGY,
                        Category.FOOD,
                        Category.MISCELLANEOUS,
                    )
                ],
            ]
        ),
        tags=[f"{ctx.project_id}:load"],
    )
    print(f"→ Registered {Fore.BLUE}{len(registry)}{Fore.RESET} Entries")
