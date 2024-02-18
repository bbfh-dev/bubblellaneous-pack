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
    tags = [
        Block.Size.SINGLE,
        Block.Uses.CUSTOM_PLACE,
    ]
    blockstates = [
        Block.State(
            "single",
            [
                Block.Predicate("FRONT", None),
                Block.Predicate("BACK", None),
                Block.Predicate("LEFT", None),
                Block.Predicate("RIGHT", None),
            ],
        ),
        Block.State(
            "north",
            [
                Block.Predicate("FRONT", None),
                Block.Predicate("BACK", None),
                Block.Predicate("LEFT", None),
                Block.Predicate("RIGHT", "#solid", "self"),
            ],
        ),
        Block.State(
            "west",
            [
                Block.Predicate("FRONT", None),
                Block.Predicate("BACK", "#solid", "self"),
                Block.Predicate("LEFT", None),
                Block.Predicate("RIGHT", None),
            ],
        ),
        Block.State(
            "south",
            [
                Block.Predicate("FRONT", None),
                Block.Predicate("BACK", None),
                Block.Predicate("LEFT", "#solid", "self"),
                Block.Predicate("RIGHT", None),
            ],
        ),
        Block.State(
            "east",
            [
                Block.Predicate("FRONT", "#solid", "self"),
                Block.Predicate("BACK", None),
                Block.Predicate("LEFT", None),
                Block.Predicate("RIGHT", None),
            ],
        ),
        Block.State(
            "nw_corner",
            [
                Block.Predicate("FRONT", None),
                Block.Predicate("BACK", "#solid", "self"),
                Block.Predicate("LEFT", None),
                Block.Predicate("RIGHT", "#solid", "self"),
            ],
        ),
        Block.State(
            "ne_corner",
            [
                Block.Predicate("FRONT", "#solid", "self"),
                Block.Predicate("BACK", None),
                Block.Predicate("LEFT", None),
                Block.Predicate("RIGHT", "#solid", "self"),
            ],
        ),
        Block.State(
            "sw_corner",
            [
                Block.Predicate("FRONT", None),
                Block.Predicate("BACK", "#solid", "self"),
                Block.Predicate("LEFT", "#solid", "self"),
                Block.Predicate("RIGHT", None),
            ],
        ),
        Block.State(
            "se_corner",
            [
                Block.Predicate("FRONT", "#solid", "self"),
                Block.Predicate("BACK", None),
                Block.Predicate("LEFT", "#solid", "self"),
                Block.Predicate("RIGHT", None),
            ],
        ),
        Block.State(
            "surrounded",
            [
                Block.Predicate("FRONT", "#solid", "self"),
                Block.Predicate("BACK", "#solid", "self"),
                Block.Predicate("LEFT", "#solid", "self"),
                Block.Predicate("RIGHT", "#solid", "self"),
            ],
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
    tags = [
        Block.Size.SINGLE,
        Block.Uses.CUSTOM_PLACE,
    ]
    blockstates = [
        Block.State(
            "single",
            [
                Block.Predicate("FRONT", None),
                Block.Predicate("BACK", None),
                Block.Predicate("LEFT", None),
                Block.Predicate("RIGHT", None),
            ],
        ),
        Block.State(
            "left",
            [
                Block.Predicate("FRONT", None),
                Block.Predicate("BACK", None),
                Block.Predicate("LEFT", None),
                Block.Predicate("RIGHT", "#solid", "self"),
            ],
        ),
        Block.State(
            "right",
            [
                Block.Predicate("FRONT", None),
                Block.Predicate("BACK", None),
                Block.Predicate("LEFT", "#solid", "self"),
                Block.Predicate("RIGHT", None),
            ],
        ),
        Block.State(
            "center",
            [
                Block.Predicate("FRONT", None),
                Block.Predicate("BACK", None),
                Block.Predicate("LEFT", "#solid", "self"),
                Block.Predicate("RIGHT", "#solid", "self"),
            ],
        ),
        Block.State(
            "left_front_corner",
            [
                Block.Predicate("FRONT", "#solid", "self"),
                Block.Predicate("BACK", None),
                Block.Predicate("LEFT", None),
                Block.Predicate("RIGHT", "#solid", "self"),
            ],
        ),
        Block.State(
            "right_front_corner",
            [
                Block.Predicate("FRONT", "#solid", "self"),
                Block.Predicate("BACK", None),
                Block.Predicate("LEFT", "#solid", "self"),
                Block.Predicate("RIGHT", None),
            ],
        ),
        Block.State(
            "corner",
            [
                Block.Predicate("FRONT", None),
                Block.Predicate("BACK", "#solid", "self"),
                Block.Predicate("LEFT", None),
                Block.Predicate("RIGHT", "#solid", "self"),
            ],
        ),
        Block.State(
            "corner",
            [
                Block.Predicate("FRONT", None),
                Block.Predicate("BACK", "#solid", "self"),
                Block.Predicate("LEFT", "#solid", "self"),
                Block.Predicate("RIGHT", None),
            ],
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
    tags = [
        Block.Size.SINGLE,
        Block.Uses.CUSTOM_PLACE,
    ]
