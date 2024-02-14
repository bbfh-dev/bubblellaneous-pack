from os import system
from beet import Context
from colorama import Fore, init

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
