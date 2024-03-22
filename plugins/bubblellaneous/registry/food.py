from plugins.bubblellaneous.internal import BlockData, Item
from plugins.bubblellaneous.internal.unit.item import ItemData
from plugins.bubblellaneous.internal.unit.variant import BlockMaterials, ItemVariant
from plugins.utils.nbt import NBT


class CoffeeCup(Item):
    """
    :yellow [☶ Description]
    TODO
    """

    base = ItemData.Base.DRINK
    recipe = [
        BlockData.RecipeEntry("item", "cocoa_beans", 2),
    ]
    params = lambda *_: NBT({})


class Cucumber(Item):
    """
    :yellow [☶ Description]
    TODO
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "wheat_seeds"),
    ]
    params = lambda *_: NBT({})


class Grapes(Item):
    """
    :yellow [☶ Description]
    TODO
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "wheat_seeds"),
    ]
    params = lambda *_: NBT({})


class Burger(Item):
    """
    :yellow [☶ Description]
    TODO
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "bread"),
        BlockData.RecipeEntry("item", "cooked_beef"),
    ]
    params = lambda *_: NBT({})


class Toast(Item):
    """
    :yellow [☶ Description]
    TODO
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "bread"),
    ]
    params = lambda *_: NBT({})


class Tomato(Item):
    """
    :yellow [☶ Description]
    TODO
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "wheat_seeds"),
    ]
    params = lambda *_: NBT({})


class Cheese(Item):
    """
    :yellow [☶ Description]
    TODO
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "milk_bucket"),
    ]
    params = lambda *_: NBT({})


class ChocolateBar(Item):
    """
    :yellow [☶ Description]
    TODO
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "cocoa_beans"),
    ]
    params = lambda *_: NBT({})


class Donut(Item):
    """
    :yellow [☶ Description]
    TODO
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "bread"),
        BlockData.RecipeEntry("item", "sugar"),
    ]
    params = lambda *_: NBT({})


class Broccoli(Item):
    """
    :yellow [☶ Description]
    TODO
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "wheat_seeds"),
    ]
    params = lambda *_: NBT({})


class Omelette(Item):
    """
    :yellow [☶ Description]
    TODO
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "egg"),
    ]
    params = lambda *_: NBT({})


class Strawberry(Item):
    """
    :yellow [☶ Description]
    TODO
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "wheat_seeds"),
    ]
    params = lambda *_: NBT({})


class Cereal(Item):
    """
    :yellow [☶ Description]
    TODO
    """

    base = ItemData.Base.FOOD
    recipe = [
        BlockData.RecipeEntry("item", "wheat", 2),
    ]
    params = lambda *_: NBT({})


class BeerBottle(ItemVariant):
    """
    :yellow [☶ Description]
    TODO
    """

    material = BlockMaterials.DYE

    base = ItemData.Base.DRINK
    recipe = [
        BlockData.RecipeEntry("item", "glass_bottle"),
        BlockData.RecipeEntry("item", "[color]"),
    ]
    params = lambda material, index: NBT(
        {"key": {"name": material.name, "index": index}}
    )
