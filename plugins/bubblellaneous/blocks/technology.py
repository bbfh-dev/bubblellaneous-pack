from ..internal.category import Category
from ..internal.entry import Block, BlockGroup
from ..large_blockstates.pipe import PIPE_BLOCKSTATES


class Ladder(BlockGroup):
    """
    :yellow [☶ Description]
    A fire escape ladder.

    :green [☄ Instructions]
    Right-click to start climbing, hold W/S to go up/down.
    Press sneak to jump off.
    """

    category = Category.TECHNOLOGY
    materials = BlockGroup.FURNITURE_TYPE
    sound = Block.Sound.INDUSTRIAL
    base = Block.Base.VOID
    facing = Block.Facing.WALL
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.BLOCKSTATES,
        Block.Uses.CUSTOM_PLACE,
        Block.Uses.NO_BASE,
    ]
    blockstates = [
        Block.State("single", None),
        Block.State(
            "top",
            Block.Predicate(
                [],
                front=None,
                back=None,
                left=None,
                right=None,
                up=False,
                use_self=True,
            ),
        ),
    ]


class PadlockBlock(BlockGroup):
    """
    :yellow [☶ Description]
    A fire escape ladder.

    :green [☄ Instructions]
    Right-click to start climbing, hold W/S to go up/down.
    Press sneak to jump off.
    """

    category = Category.NONE
    materials = BlockGroup.WOOL_TYPE
    sound = Block.Sound.INDUSTRIAL
    base = Block.Base.VOID
    facing = Block.Facing.DOOR
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.CUSTOM_PLACE,
        Block.Uses.NO_BASE,
    ]
    blockstates = [
        Block.State("left", None),
        Block.State("right", None),
    ]


class RisingDoor(BlockGroup):
    """
    :yellow [☶ Description]
    A vertically sliding door.

    :green [☄ Instructions]
    Right click to open/close.
    """

    category = Category.TECHNOLOGY
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


class Pipe(Block):
    """
    :yellow [☶ Description]
    Can be used as both decoration and in combination with other blocks

    :green [☄ Instructions]
    Simply put pipes next to each other, they will automatically connect.
    """

    category = Category.TECHNOLOGY
    sound = Block.Sound.WOOD
    base = Block.Base.VOID
    facing = Block.Facing.SURFACE
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.BLOCKSTATES,
        Block.Uses.ALL_DIMENSIONS,
    ]
    blockstates = PIPE_BLOCKSTATES


class Radiator(Block):
    """
    :yellow [☶ Description]
    Used for melting snow and ice.

    :green [☄ Instructions]
    Right click on the block to toggle it on and off.
    If there are pipes connected to the heater it will radiate across their entire area.
    """

    category = Category.TECHNOLOGY
    sound = Block.Sound.INDUSTRIAL
    base = Block.Base.CONTAINER
    facing = Block.Facing.PLAYER
    recipe = []
    tags = [
        Block.Size.SINGLE,
        Block.Uses.GUI,
        Block.Uses.BRIGHTNESS_FIX,
        Block.Uses.TICK,
    ]
    blockstates = [
        Block.State("off", None),
        Block.State("on", None),
    ]
