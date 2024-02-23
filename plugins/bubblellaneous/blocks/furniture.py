from ..internal.category import Category
from ..internal.entry import Block, BlockGroup


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
        Block.Uses.GUI,
        Block.Uses.BRIGHTNESS_FIX,
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
                [],
                front=False,
                back=True,
                left=False,
                right=False,
                use_self=True,
            ),
        ),
        Block.State(
            "west",
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
            "south",
            Block.Predicate(
                [],
                front=True,
                back=False,
                left=False,
                right=False,
                use_self=True,
            ),
        ),
        Block.State(
            "east",
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
            "nw_corner",
            Block.Predicate(
                [],
                front=False,
                back=True,
                left=True,
                right=False,
                use_self=True,
            ),
        ),
        Block.State(
            "ne_corner",
            Block.Predicate(
                [],
                front=False,
                back=True,
                left=False,
                right=True,
                use_self=True,
            ),
        ),
        Block.State(
            "sw_corner",
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
            "se_corner",
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
            "surrounded",
            Block.Predicate(
                [],
                front=True,
                back=True,
                left=False,
                right=False,
                use_self=True,
            ),
            Block.Predicate(
                [],
                front=False,
                back=False,
                left=True,
                right=True,
                use_self=True,
            ),
            Block.Predicate(
                [],
                front=None,
                back=True,
                left=True,
                right=True,
                use_self=True,
            ),
            Block.Predicate(
                [],
                front=True,
                back=None,
                left=True,
                right=True,
                use_self=True,
            ),
            Block.Predicate(
                [],
                front=True,
                back=True,
                left=None,
                right=True,
                use_self=True,
            ),
            Block.Predicate(
                [],
                front=True,
                back=True,
                left=True,
                right=None,
                use_self=True,
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
    recipe = [
        Block.RecipeItem("[base]", "block", 6),
    ]
    tags = [
        Block.Size.SINGLE,
        Block.Uses.CUSTOM_PLACE,
    ]


class Cabinet(BlockGroup):
    """
    :yellow [☶ Description]
    A container block.
    """

    category = Category.FURNITURE
    materials = BlockGroup.FURNITURE_TYPE
    sound = Block.Sound.WOOD
    base = Block.Base.CONTAINER
    facing = Block.Facing.PLAYER
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.BRIGHTNESS_FIX,
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
        Block.Uses.BRIGHTNESS_FIX,
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


class Blinds(BlockGroup):
    """
    :yellow [☶ Description]
    A decoration item.
    """

    category = Category.FURNITURE
    materials = BlockGroup.FURNITURE_TYPE
    sound = Block.Sound.WOOD
    base = Block.Base.VOID
    facing = Block.Facing.WALL
    recipe = []
    tags = [
        Block.Size.SINGLE,
    ]


class KitchenCabinet(BlockGroup):
    """
    :yellow [☶ Description]
    A container block.
    """

    category = Category.FURNITURE
    materials = BlockGroup.FURNITURE_TYPE
    sound = Block.Sound.WOOD
    base = Block.Base.CONTAINER
    facing = Block.Facing.PLAYER
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.BRIGHTNESS_FIX,
    ]


class Fridge(Block):
    """
    :yellow [☶ Description]
    A container block.
    """

    category = Category.FURNITURE
    sound = Block.Sound.INDUSTRIAL
    base = Block.Base.CONTAINER
    facing = Block.Facing.PLAYER
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.BLOCKSTATES,
        Block.Uses.BRIGHTNESS_FIX,
    ]
    blockstates = [
        Block.State("upper", None),
        Block.State(
            "lower",
            Block.Predicate(
                [],
                front=None,
                back=None,
                left=None,
                right=None,
                up=True,
                use_self=True,
            ),
        ),
    ]


class Washer(Block):
    """
    :yellow [☶ Description]
    Washes clothes.

    :green [☄ Instructions]
    Place water above to refill.
    A single bucket of water can wash up to 16 items.
    Put cloths inside to wash their color away.
    """

    category = Category.FURNITURE
    sound = Block.Sound.INDUSTRIAL
    base = Block.Base.HOPPER
    facing = Block.Facing.PLAYER
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.TICK,
    ]
    blockstates = [
        Block.State("empty", None),
        Block.State("full", None),
    ]


class Trashcan(Block):
    """
    :yellow [☶ Description]
    Erases items from existance.

    :green [☄ Instructions]
    Right-click it while shifting to erase the item from your mainhand.
    """

    category = Category.FURNITURE
    sound = Block.Sound.WOOD
    base = Block.Base.CHAIN
    facing = Block.Facing.NONE
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.CUSTOM_PLACE,
        Block.Uses.BRIGHTNESS_FIX,
    ]


class TableLamp(BlockGroup):
    """
    :yellow [☶ Description]
    Decoration block that emits light.
    """

    category = Category.FURNITURE
    materials = BlockGroup.WOOL_TYPE
    sound = Block.Sound.WOOD
    base = Block.Base.VOID
    facing = Block.Facing.NONE
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.CUSTOM_PLACE,
        Block.Uses.NO_BASE,
        Block.Uses.CUSTOM_BASE,
    ]


class StreetLight(BlockGroup):
    """
    :yellow [☶ Description]
    Decoration block that emits light.
    Can be placed on on both blocks and walls.
    """

    category = Category.FURNITURE
    materials = BlockGroup.FURNITURE_TYPE
    sound = Block.Sound.WOOD
    base = Block.Base.VOID
    facing = Block.Facing.PLAYER
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.BLOCKSTATES,
        Block.Uses.CUSTOM_PLACE,
        Block.Uses.NO_BASE,
        Block.Uses.CUSTOM_BASE,
    ]
    blockstates = [
        Block.State("stand", None),
        Block.State(
            "wall",
            Block.Predicate(
                ["!#no_solid_collision"],
                front=None,
                back=True,
                left=None,
                right=None,
                use_self=False,
            ),
        ),
    ]


class DeskLamp(BlockGroup):
    """
    :yellow [☶ Description]
    Decoration block that emits light.
    """

    category = Category.FURNITURE
    materials = BlockGroup.WOOL_TYPE
    sound = Block.Sound.WOOD
    base = Block.Base.VOID
    facing = Block.Facing.PLAYER
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.CUSTOM_PLACE,
        Block.Uses.NO_BASE,
        Block.Uses.CUSTOM_BASE,
    ]


class UpholsteryCouch(BlockGroup):
    """
    :yellow [☶ Description]
    Decoration block that you can sit on.
    """

    category = Category.FURNITURE
    materials = BlockGroup.WOOD_WITH_WOOL_TYPE
    sound = Block.Sound.WOOD
    base = Block.Base.TRIPWIRE
    facing = Block.Facing.PLAYER
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.BLOCKSTATES,
        Block.Uses.CUSTOM_PLACE,
    ]
    blockstates = [
        Block.State("single", None),
        Block.State(
            "left",
            Block.Predicate(
                [],
                front=None,
                back=None,
                left=False,
                right=True,
                use_self=True,
            ),
        ),
        Block.State(
            "right",
            Block.Predicate(
                [],
                front=None,
                back=None,
                left=True,
                right=False,
                use_self=True,
            ),
        ),
        Block.State(
            "middle",
            Block.Predicate(
                [],
                front=None,
                back=None,
                left=True,
                right=True,
                use_self=True,
            ),
        ),
    ]


class FloorLamp(BlockGroup):
    """
    :yellow [☶ Description]
    Decoration block that emits light.
    """

    category = Category.FURNITURE
    materials = BlockGroup.WOOL_TYPE
    sound = Block.Sound.WOOL
    base = Block.Base.VOID
    facing = Block.Facing.NONE
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.CUSTOM_PLACE,
        Block.Uses.NO_BASE,
        Block.Uses.CUSTOM_BASE,
    ]


class Curtains(Block):
    """
    :yellow [☶ Description]
    Decoration block that can cover windows.
    """

    category = Category.FURNITURE
    sound = Block.Sound.WOOL
    base = Block.Base.VOID
    facing = Block.Facing.WALL
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.CUSTOM_PLACE,
    ]
    blockstates = [
        Block.State("top", None),
        Block.State("top_left", None),
        Block.State("top_right", None),
        Block.State("middle", None),
        Block.State("bottom", None),
        Block.State("bottom_left", None),
        Block.State("bottom_right", None),
        Block.State("empty", None),
    ]
