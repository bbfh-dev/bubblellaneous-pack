from beet import Context

from plugins.utils import NBT

from .pack_formats import PACK_FORMATS


class Preprocessor:
    def __init__(self, ctx: Context) -> None:
        self._ctx = ctx

    def print(self, line: str):
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

    def printf(self, line: str):
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

    def repeat(self, line: str):
        lines = []
        iterator, command = line.split(" | ")
        iter_var, iter_range = iterator.split("=")
        iter_from, iter_to = iter_range.split("..")
        for i in range(int(iter_from), int(iter_to) + 1):
            lines.append(command.replace(f"<{iter_var}>", str(i)))

        return "\n".join(lines)

    def overlay(self, line: str):
        versions, command = line.split(" | ")
        version_from, version_to = versions.split("-")
        min_version = PACK_FORMATS.get(version_from)
        max_version = PACK_FORMATS.get(version_to)
        if min_version is None or max_version is None:
            raise Exception(
                f"Preprocessor caught unknown version: {min_version=}-{max_version=}"
            )

        if (
            self._ctx.data.pack_format >= min_version[0]
            and self._ctx.data.pack_format <= max_version[-1]
        ):
            return command

        return ""


def beet_default(ctx: Context):
    preprocessor = Preprocessor(ctx)
    for key, value in preprocessor.__class__.__dict__.items():
        if key.startswith("_"):
            continue
        for fn_key, body in ctx.data.functions.items():
            for i, line in enumerate(body.lines):
                if not line.startswith(f"#!/{key} "):
                    continue
                ctx.data.functions[fn_key].lines[i] = value(
                    preprocessor, line[len(key) + 4 :]
                )
