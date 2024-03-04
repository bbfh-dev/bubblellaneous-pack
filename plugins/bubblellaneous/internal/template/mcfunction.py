import os
from pathlib import Path

__dir__ = Path(__file__).parent.resolve()

with open(os.path.join(__dir__, "code", "place.mcfunction"), "r") as fp:
    PLACE_TEMPLATE = fp.readlines()

with open(os.path.join(__dir__, "code", "recipe.mcfunction"), "r") as fp:
    RECIPE_TEMPLATE = fp.readlines()

with open(os.path.join(__dir__, "code", "give.mcfunction"), "r") as fp:
    GIVE_TEMPLATE = fp.readlines()

with open(os.path.join(__dir__, "code", "spawn.mcfunction"), "r") as fp:
    SPAWN_TEMPLATE = fp.readlines()
