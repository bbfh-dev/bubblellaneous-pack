from threading import Thread

from beet import Context

from plugins.bubblellaneous.internal.tree import Tree
from plugins.bubblellaneous.internal.unit.variant import Variant
from plugins.bubblellaneous.registry import REGISTRY


def compile(ctx: Context):
    unit_id = 1
    tree = Tree()
    threads: list[Thread] = []

    for unit in [i for i in REGISTRY if not isinstance(i, Variant)]:
        threads.append(
            thread := Thread(
                target=unit.compile,
                name=unit.__class__.__name__,
                args=(
                    ctx,
                    unit_id,
                    tree,
                ),
            )
        )
        thread.start()
        unit_id += unit.allocate_ids()

    tree.compile(ctx)
