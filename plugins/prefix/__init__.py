import json

from beet import Advancement, Context, LootTable


def beet_default(ctx: Context):
    """
    Replaces ".local" in all files with prefix defined in beet.json
    """
    prefix = f"{ctx.meta['prefix']}."

    for key, body in ctx.data.functions.items():
        for i, line in enumerate(body.lines):
            ctx.data.functions[key].lines[i] = line.replace("local.", prefix)

    for key, body in ctx.data.advancements.items():
        ctx.data.advancements[key] = Advancement(
            json.loads(json.dumps(body.data).replace("local.", prefix))
        )

    for key, body in ctx.data.loot_tables.items():
        ctx.data.loot_tables[key] = LootTable(
            json.loads(json.dumps(body.data).replace("local.", prefix))
        )
