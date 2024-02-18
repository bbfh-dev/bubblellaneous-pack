import csv
from os import path
from pathlib import Path

from beet import Context, Language
from mergedeep import merge

__DIR__ = Path(__file__).parent.resolve()


def read_row(ctx: Context, row: list[str], languages: list[str]):
    return {
        lang: {f"{row[0]}.{ctx.project_id}.{row[1]}": row[i]}
        for i, lang in enumerate(languages, start=2) if row[i]
    }


def beet_default(ctx: Context):
    languages = []
    lang = {}

    with open(path.join(__DIR__, "data", "lang.tsv"), "r") as fp:
        reader = csv.reader(fp, delimiter="\t")
        is_first = True
        for row in reader:
            if not is_first:
                lang = merge(lang, read_row(ctx, row, languages))
                continue
            for col in row[2:]:
                languages.append(col.lower())
                is_first = False

    for name, values in lang.items():
        ctx.assets[f"minecraft:{name}"] = Language(values)
