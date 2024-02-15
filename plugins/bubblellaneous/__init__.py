from beet import Context, Function
from colorama import Fore, init

from plugins.utils.nbt import NBT

from .blocks import *
from .internal.entry import BaseEntry
from .internal.tree import Tree

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
]


def beet_default(ctx: Context):
    init()
    tree = Tree()
    id = 1
    for item in REGISTRY:
        id_before = id
        tree, id = item(ctx).setup().compile(tree, id)
        display_id = (
            f"#{id-1}"
            if id - id_before == 1
            else f"#{id_before}..{id-1} ({id - id_before-1})"
        )
        print(f"→ Registered {Fore.BLUE}{item.__name__: <16}{Fore.RESET} {display_id}")
    tree.format_code(ctx).dump(ctx)

    ctx.data.functions[f"{ctx.project_id}:load_registry"] = Function(
        "\n".join(
            [
                "data modify storage {} bench_registry set value {}".format(
                    ctx.project_id,
                    NBT(
                        [
                            {
                                "entry": item.entry,
                                "items": item.items,
                                "count": item.count,
                            }
                            for item in tree.bench_registry
                        ]
                    ).get_list(),
                ),
            ]
        ),
        tags=[f"{ctx.project_id}:load"],
    )
