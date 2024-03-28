from plugins.bubblellaneous.internal import BlockData, Item
from plugins.bubblellaneous.internal.unit.item import ItemData
from plugins.bubblellaneous.internal.unit.variant import BlockMaterials, ItemVariant


class CoffeeCup(Item):
    """
    :yellow [☶ Description]
    Empty.
    """

    base = ItemData.Base.DRINK
    recipe = [
        BlockData.RecipeEntry("item", "cocoa_beans", 2),
    ]
    params = lambda *_: {}


class Cucumber(Item):
    """
    :yellow [☶ Description]
    Empty.
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "wheat_seeds"),
    ]
    params = lambda *_: {}


class Grapes(Item):
    """
    :yellow [☶ Description]
    Empty.
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "wheat_seeds"),
    ]
    params = lambda *_: {}


class Burger(Item):
    """
    :yellow [☶ Description]
    Empty.
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "bread"),
        BlockData.RecipeEntry("item", "cooked_beef"),
    ]
    params = lambda *_: {}


class Toast(Item):
    """
    :yellow [☶ Description]
    Empty.
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "bread"),
    ]
    params = lambda *_: {}


class Tomato(Item):
    """
    :yellow [☶ Description]
    Empty.
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "wheat_seeds"),
    ]
    params = lambda *_: {}


class Cheese(Item):
    """
    :yellow [☶ Description]
    Empty.
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "milk_bucket"),
    ]
    params = lambda *_: {}


class ChocolateBar(Item):
    """
    :yellow [☶ Description]
    Empty.
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "cocoa_beans"),
    ]
    params = lambda *_: {}


class Donut(Item):
    """
    :yellow [☶ Description]
    Empty.
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "bread"),
        BlockData.RecipeEntry("item", "sugar"),
    ]
    params = lambda *_: {}


class Broccoli(Item):
    """
    :yellow [☶ Description]
    Empty.
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "wheat_seeds"),
    ]
    params = lambda *_: {}


class Omelette(Item):
    """
    :yellow [☶ Description]
    Empty.
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "egg"),
    ]
    params = lambda *_: {}


class Strawberry(Item):
    """
    :yellow [☶ Description]
    Empty.
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "wheat_seeds"),
    ]
    params = lambda *_: {}


class Cereal(Item):
    """
    :yellow [☶ Description]
    Empty.
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "wheat", 2),
    ]
    params = lambda *_: {}


class BeerBottle(ItemVariant):
    """
    :yellow [☶ Description]
    Empty.
    """

    material = BlockMaterials.DYE

    base = ItemData.Base.DRINK
    recipe = [
        BlockData.RecipeEntry("item", "glass_bottle"),
        BlockData.RecipeEntry("item", "[color]"),
    ]
    params = lambda material, index: {"key": {"name": material.name, "index": index}}
