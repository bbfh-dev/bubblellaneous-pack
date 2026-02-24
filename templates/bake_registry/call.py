#!/bin/python3

from pathlib import Path
import sys
import json

if len(sys.argv) != 2:
    sys.exit(1)

build_dir = Path(sys.argv[1])
for category in ["furniture", "miscellaneous", "technology", "food"]:
    output_registry = []

    path = (
        build_dir
        / "data_pack"
        / "data"
        / "bubblellaneous"
        / "_bubble_bench_registry"
        / category
    )
    for file in path.iterdir():
        data = file.read_text("utf-8")
        entries = []
        for line in data.splitlines():
            fields = line.removeprefix("# ").split(" ")
            entries.append(
                {
                    "index": int(fields[0]),
                    "item": fields[1],
                    "recipe": json.loads(fields[2]),
                }
            )
        entries.sort(key=lambda x: x["index"])

        if len(entries) == 1:
            del entries[0]["index"]
            output_registry.append(entries[0])
        else:
            for entry in entries:
                del entry["index"]
            output_registry.append(
                {"size": len(entries), "item": entries[0]["item"], "items": entries}
            )

    path = (
        build_dir
        / "data_pack"
        / "data"
        / "bubblellaneous"
        / "function"
        / "generated"
        / "load_registry"
        / f"{category}.mcfunction"
    )
    path.parent.mkdir(511, True, True)

    def sort(x: dict):
        if x.get("item") == None:
            return x.get("items")[0]["item"]
        else:
            return x.get("item")

    output_registry.sort(key=sort)
    data = json.dumps(output_registry, indent="\t")
    path.write_text(
        f"data modify storage minecraft:bubblellaneous registry.{category} set value {data.replace('\n', '\\\n')}"
    )
