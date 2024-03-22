from beet import Context

from plugins.bubblellaneous.internal.tree import Tree
from plugins.bubblellaneous.registry import REGISTRY


def compile(ctx: Context):
    unit_id = 1
    tree = Tree()

    for unit in REGISTRY:
        unit.compile(ctx, unit_id, tree)
        unit_id += unit.allocate_ids()

    tree.compile(ctx)
    print(f"(Bubblellaneous) Finished compiling {len(REGISTRY)} units.")
