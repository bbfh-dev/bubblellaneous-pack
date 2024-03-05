from enum import Enum
from typing import Self, override

from ..category import Category
from .base import Base


class ItemData:
    class Base(Enum):
        INTERACTIVE = "minecraft:carrot_on_a_stick"


class Item(Base):
    @property
    @override
    def unit_tag(self) -> dict:
        return {"[namespace]": {"item_properties": {}}}

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
                for key in ["base", "sound", "facing", "recipe", "tags", "blockstates"]
            },
        )
