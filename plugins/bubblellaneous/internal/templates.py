import json
from os import path
from pathlib import Path

from plugins.utils.nbt import NBT, NBTType

__DIR__ = Path(__file__).parent.resolve()


def use_template(name: str, mappings: dict[str, NBT | NBTType]) -> NBT:
    with open(path.join(__DIR__.parent.resolve(), "template", name), "r") as fp:
        data = json.load(fp)

    nbt = NBT(data, is_json=True)
    for key, value in mappings.items():
        nbt.add_override(f"<{key}>", value)

    return nbt
