from enum import Enum
from typing import Self, override

from ..category import Category
from .base import Base


class ItemData:
    class Base(Enum):
        INTERACTIVE = "minecraft:carrot_on_a_stick"
        DRINK = "minecraft:honey_bottle"
        FOOD = "minecraft:bread"
        PICKAXE = "minecraft:stone_pickaxe"
        NORMAL = "minecraft:firework_star"


class Item(Base):
    @property
    @override
    def unit_tag(self) -> dict:
        limit_attack_speed = (
            {"AttributeModifiers": "[attack_speed]"}
            if self.read_property("limit_attack_speed", False)
            else {}
        )
        return {
            "[namespace]": {
                "item_properties": self.read_property("params", lambda *_: {})(
                    self.prop("material", "default"), self.prop("material_index", 0)
                ),
                "item_data": {
                    "id": self.complete_name,
                    "name": self.name,
                    "material": {
                        "name": self.prop("material", "default"),
                        "index": self.prop("material_index", 0),
                    },
                    "custom_model_data": self.custom_model_data,
                },
            },
            "HideFlags": 255,
            **limit_attack_speed,
        }

    @override
    def prepare(self) -> Self:
        return self.set_properties(
            name=self.name,
            base_item=self.read_property(
                "base.value", default="minecraft:structure_void"
            ),
            unit="item",
            path=[self.name],
            is_single=True,
            **{
                key: self.read_property(key, None)
                for key in [
                    "base",
                    "sound",
                    "facing",
                    "recipe",
                    "tags",
                    "blockstates",
                    "is_unlisted",
                ]
            },
        )
