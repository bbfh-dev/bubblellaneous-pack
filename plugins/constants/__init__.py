import re

from beet import Context


def beet_default(ctx: Context):
    """
    Automatically creates constants that are used inside of the code.
    Scoreboard operations often require them, so now developer only needs
    to write "<number> local.int" for it to be registered
    """
    numbers: set[int] = set()

    for body in ctx.data.functions.values():
        for line in body.lines:
            for i in [int(match) for match in re.findall(r"(\d+) local.int", line)]:
                numbers.add(i)

    ctx.data.functions["bubblellaneous:load"].lines.extend(
        [
            "",
            "# --- Constants:",
            *[
                f"scoreboard players set {number} local.int {number}"
                for number in numbers
            ],
        ]
    )
