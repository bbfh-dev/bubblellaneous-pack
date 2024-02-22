from .internal.category import Category
from .internal.entry.block import Block
from .internal.entry.item import Item
from .internal.entry.item_group import ItemGroup


class Padlock(Item):
    """
    :yellow [☶ Description]
    Used for locking doors.

    :green [☄ Instructions]
    Sneak and click on a door to lock it.
    Use a key on the door for the first time to set it as the key.
    """

    category = Category.TECHNOLOGY
    base = Item.Base.CARROT_ON_A_STICK
    params = lambda *_: {}
    recipe = []


class Key(ItemGroup):
    """
    :yellow [☶ Description]
    Used for unlocking doors that have a padlock on them.

    :green [☄ Instructions]
    Right click on padlock.
    """

    category = Category.TECHNOLOGY
    materials = ItemGroup.COLOR_TYPE
    base = Item.Base.CARROT_ON_A_STICK
    params = lambda material, index: {"key": {"name": material, "index": index}}
    recipe = []
