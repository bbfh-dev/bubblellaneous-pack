from .internal.category import Category
from .internal.entry import Block, BlockGroup


class BubbleBench(Block):
    """
    :yellow [☶ Description]
    Used for obtaining all of the custom blocks & items.

    :green [☄ Instructions]
    Right click on the block and use the UI to navigate around and craft items.
    """

    category = Category.FURNITURE
    sound = Block.Sound.INDUSTRIAL
    base = Block.Base.CONTAINER
    facing = Block.Facing.PLAYER
    recipe = [
        Block.RecipeItem("crafting_table", "block"),
        Block.RecipeItem("glass_bottle", "item"),
    ]
    tags = [
        Block.Size.SINGLE,
        Block.Uses.TICK,
        Block.Uses.GUI,
    ]


class Table(BlockGroup):
    """
    :yellow [☶ Description]
    A decoration item. Can connect to other tables.
    """

    category = Category.FURNITURE
    materials = BlockGroup.FURNITURE_TYPE
    sound = Block.Sound.WOOD
    base = Block.Base.TOP_SLAB
    facing = Block.Facing.NONE
    recipe = [Block.RecipeItem("[base]", "block", 7)]
    tags = [
        Block.Size.SINGLE,
        Block.Uses.CUSTOM_PLACE,
        Block.Uses.BLOCKSTATES,
    ]
    blockstates = [
        Block.State("single", None),
        Block.State(
            "north",
            Block.Predicate(
                ["!#no_solid_collision"],
                front=False,
                back=True,
                left=False,
                right=False,
                use_self=False,
            ),
        ),
        Block.State(
            "west",
            Block.Predicate(
                ["!#no_solid_collision"],
                front=False,
                back=False,
                left=True,
                right=False,
                use_self=False,
            ),
        ),
        Block.State(
            "south",
            Block.Predicate(
                ["!#no_solid_collision"],
                front=True,
                back=False,
                left=False,
                right=False,
                use_self=False,
            ),
        ),
        Block.State(
            "east",
            Block.Predicate(
                ["!#no_solid_collision"],
                front=False,
                back=False,
                left=False,
                right=True,
                use_self=False,
            ),
        ),
        Block.State(
            "nw_corner",
            Block.Predicate(
                ["!#no_solid_collision"],
                front=False,
                back=True,
                left=True,
                right=False,
                use_self=False,
            ),
        ),
        Block.State(
            "ne_corner",
            Block.Predicate(
                ["!#no_solid_collision"],
                front=False,
                back=True,
                left=False,
                right=True,
                use_self=False,
            ),
        ),
        Block.State(
            "sw_corner",
            Block.Predicate(
                ["!#no_solid_collision"],
                front=True,
                back=False,
                left=True,
                right=False,
                use_self=False,
            ),
        ),
        Block.State(
            "se_corner",
            Block.Predicate(
                ["!#no_solid_collision"],
                front=True,
                back=False,
                left=False,
                right=True,
                use_self=False,
            ),
        ),
        Block.State(
            "surrounded",
            Block.Predicate(
                ["!#no_solid_collision"],
                front=True,
                back=True,
                left=False,
                right=False,
                use_self=False,
            ),
            Block.Predicate(
                ["!#no_solid_collision"],
                front=False,
                back=False,
                left=True,
                right=True,
                use_self=False,
            ),
            Block.Predicate(
                ["!#no_solid_collision"],
                front=None,
                back=True,
                left=True,
                right=True,
                use_self=False,
            ),
            Block.Predicate(
                ["!#no_solid_collision"],
                front=True,
                back=None,
                left=True,
                right=True,
                use_self=False,
            ),
            Block.Predicate(
                ["!#no_solid_collision"],
                front=True,
                back=True,
                left=None,
                right=True,
                use_self=False,
            ),
            Block.Predicate(
                ["!#no_solid_collision"],
                front=True,
                back=True,
                left=True,
                right=None,
                use_self=False,
            ),
        ),
    ]


class Shelf(BlockGroup):
    """
    :yellow [☶ Description]
    A decoration item. You can place/take an item by right clicking on the shelf.
    """

    category = Category.FURNITURE
    materials = BlockGroup.FURNITURE_TYPE
    sound = Block.Sound.WOOD
    base = Block.Base.VOID
    facing = Block.Facing.WALL
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.CUSTOM_PLACE,
    ]


class Cabinet(BlockGroup):
    """
    :yellow [☶ Description]
    A decoration item. Simply a container.
    """

    category = Category.FURNITURE
    materials = BlockGroup.FURNITURE_TYPE
    sound = Block.Sound.WOOD
    base = Block.Base.CONTAINER
    facing = Block.Facing.PLAYER
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.CUSTOM_PLACE,
    ]


class Drawer(BlockGroup):
    """
    :yellow [☶ Description]
    A decoration item.
    """

    category = Category.FURNITURE
    materials = BlockGroup.FURNITURE_TYPE
    sound = Block.Sound.WOOD
    base = Block.Base.TOP_SLAB
    facing = Block.Facing.PLAYER
    recipe = []
    tags = [
        Block.Size.SINGLE,
    ]


class Cupboard(BlockGroup):
    """
    :yellow [☶ Description]
    A decoration item. Right click on a shelf to place/remove an item from it.
    """

    category = Category.FURNITURE
    materials = BlockGroup.FURNITURE_TYPE
    sound = Block.Sound.WOOD
    base = Block.Base.SOLID
    facing = Block.Facing.PLAYER
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.CUSTOM_PLACE,
    ]


class Bench(BlockGroup):
    """
    :yellow [☶ Description]
    A decoration item. Right click to sit.
    """

    category = Category.FURNITURE
    materials = BlockGroup.FURNITURE_TYPE
    sound = Block.Sound.WOOD
    base = Block.Base.TRIPWIRE
    facing = Block.Facing.PLAYER
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.CUSTOM_PLACE,
    ]


class Couch(BlockGroup):
    """
    :yellow [☶ Description]
    A decoration item. Right click to sit. Connects to other couches.
    """

    category = Category.FURNITURE
    materials = BlockGroup.WOOL_TYPE
    sound = Block.Sound.WOOL
    base = Block.Base.TRIPWIRE
    facing = Block.Facing.PLAYER
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.CUSTOM_PLACE,
        Block.Uses.BLOCKSTATES,
    ]
    blockstates = [
        Block.State("single", None),
        Block.State(
            "left",
            Block.Predicate(
                [],
                front=False,
                back=False,
                left=True,
                right=False,
                use_self=True,
            ),
        ),
        Block.State(
            "right",
            Block.Predicate(
                [],
                front=False,
                back=False,
                left=False,
                right=True,
                use_self=True,
            ),
        ),
        Block.State(
            "center",
            Block.Predicate(
                [],
                front=False,
                back=False,
                left=True,
                right=True,
                use_self=True,
            ),
        ),
        Block.State(
            "left_front_corner",
            Block.Predicate(
                [],
                front=True,
                back=False,
                left=True,
                right=False,
                use_self=True,
            ),
        ),
        Block.State(
            "right_front_corner",
            Block.Predicate(
                [],
                front=True,
                back=False,
                left=False,
                right=True,
                use_self=True,
            ),
        ),
        Block.State(
            "corner",
            Block.Predicate(
                [],
                front=None,
                back=True,
                left=None,
                right=None,
                use_self=True,
            ),
        ),
    ]


class Stool(BlockGroup):
    """
    :yellow [☶ Description]
    A decoration item. Right click to sit.
    """

    category = Category.FURNITURE
    materials = BlockGroup.WOOD_TYPE
    sound = Block.Sound.WOOD
    base = Block.Base.VOID
    facing = Block.Facing.PLAYER
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.CUSTOM_PLACE,
    ]


class Barstool(BlockGroup):
    """
    :yellow [☶ Description]
    A decoration item. Right click to sit.
    """

    category = Category.FURNITURE
    materials = BlockGroup.WOOD_TYPE
    sound = Block.Sound.WOOD
    base = Block.Base.VOID
    facing = Block.Facing.PLAYER
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.CUSTOM_PLACE,
    ]


class DinningChair(BlockGroup):
    """
    :yellow [☶ Description]
    A decoration item. Right click to sit.
    """

    category = Category.FURNITURE
    materials = BlockGroup.WOOD_WITH_WOOL_TYPE
    sound = Block.Sound.WOOD
    base = Block.Base.VOID
    facing = Block.Facing.PLAYER
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.CUSTOM_PLACE,
    ]
