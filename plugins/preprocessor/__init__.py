from beet import Context

from plugins.utils import NBT


class Preprocessor:
    @staticmethod
    def print(line: str):
        selector, scoreboard = line.split(" ")
        return "tellraw @a {}".format(
            NBT(
                [
                    "",
                    {"text": scoreboard, "color": "yellow"},
                    ":",
                    {"selector": "@s", "color": "gray"},
                    " = ",
                    {"score": {"name": selector, "objective": scoreboard}},
                ],
                is_json=True,
            )
            .get_list()
            .replace('\\"', '"')
        )

    @staticmethod
    def printf(line: str):
        category, selector, nbt = line.split(" ")
        return "tellraw @a {}".format(
            NBT(
                [
                    "",
                    {"text": category, "color": "yellow"},
                    ":",
                    {"selector": "@s", "color": "gray"},
                    " = ",
                    {f"{category}": selector, "nbt": nbt},
                ],
                is_json=True,
            )
        )

    @staticmethod
    def repeat(line: str):
        lines = []
        iterator, command = line.split(" | ")
        iter_var, iter_range = iterator.split("=")
        iter_from, iter_to = iter_range.split("..")
        for i in range(int(iter_from), int(iter_to) + 1):
            lines.append(command.replace(f"<{iter_var}>", str(i)))

        return "\n".join(lines)


def beet_default(ctx: Context):
    for key, value in Preprocessor.__dict__.items():
        if key.startswith("__"):
            continue
        for fn_key, body in ctx.data.functions.items():
            for i, line in enumerate(body.lines):
                if not line.startswith(f"#!/{key} "):
                    continue
                ctx.data.functions[fn_key].lines[i] = value(line[len(key) + 4 :])
