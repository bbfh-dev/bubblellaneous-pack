from plugins.bubblellaneous.internal import (
    Block,
    BlockData,
    BlockMaterials,
    Item,
    ItemData,
    Variant,
)
from plugins.bubblellaneous.internal.unit.variant import BlockVariant, ItemVariant
from plugins.utils import NBT


class Ladder(BlockVariant):
    """
    :yellow [☶ Description]
    TODO
    """

    material = BlockMaterials.SOLID

    base = BlockData.Base.VOID
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.WALL_NORMAL
    recipe = [
        BlockData.RecipeEntry("block", "ladder"),
    ]
    tags = [
        BlockData.Uses.PLACE,
        BlockData.Uses.BLOCKSTATES,
        BlockData.Uses.NO_BASE,
        BlockData.Uses.CUSTOM_BASE,
    ]
    blockstates = BlockData.BlockStates(
        "@self",
        BlockData.State("default"),
        BlockData.State("top", "~~~~0~"),
    )


class PadlockBlock(BlockVariant):
    """
    :yellow [☶ Description]
    TODO
    """

    material = BlockMaterials.WOOL

    is_unlisted = True
    base = BlockData.Base.NONE
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.DOOR
    recipe = []
    tags = [
        BlockData.Uses.PLACE,
        BlockData.Uses.NO_BASE,
        BlockData.Uses.CUSTOM_BASE,
    ]
    blockstates = BlockData.BlockStates(
        "@self",
        BlockData.State("left"),
        BlockData.State("right"),
    )


class RisingDoor(BlockVariant):
    """
    :yellow [☶ Description]
    TODO
    """

    material = BlockMaterials.SOLID

    base = BlockData.Base.NONE
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "[base]"),
    ]
    tags = [
        BlockData.Uses.PLACE,
        BlockData.Uses.BLOCKSTATES,
        BlockData.Uses.NO_BASE,
        BlockData.Uses.TIMER,
    ]
    blockstates = BlockData.BlockStates(
        "@self",
        BlockData.State("default"),
        BlockData.State("bottom", "~~~~1~"),
    )


class Pipe(Block):
    """
    :yellow [☶ Description]
    TODO
    """

    base = BlockData.Base.VOID
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.NONE
    recipe = [
        BlockData.RecipeEntry("block", "copper_block"),
    ]
    tags = [
        BlockData.Uses.BLOCKSTATES,
        BlockData.Uses.BLOCKSTATE_HOOK,
    ]
    blockstates = BlockData.BlockStates(
        "@self",
        BlockData.State("default"),
        # Straight
        BlockData.State(
            "straight",
            "110000:0",
            "001100:90",
            "010000:0",
            "000100:90",
            "100000:0",
            "001000:90",
        ),
        # Angles
        BlockData.State(
            "angle_left",
            "101000:0",
            "100100:-90",
            "011000:90",
            "010100:180",
        ),
        BlockData.State(
            "angle_up",
            "001010:90",
            "000110:-90",
            "100010:0",
            "010010:180",
        ),
        BlockData.State(
            "angle_down",
            "001001:90",
            "000101:-90",
            "100001:0",
            "010001:180",
        ),
        # Corners
        BlockData.State(
            "corner_up",
            "101010:0",
            "100110:-90",
            "011010:90",
            "010110:180",
        ),
        BlockData.State(
            "corner_down",
            "101001:0",
            "100101:-90",
            "011001:90",
            "010101:180",
        ),
        # Sides
        BlockData.State(
            "side_left",
            "111011:0",
            "011111:90",
            "110111:180",
            "101111:-90",
        ),
        BlockData.State(
            "side_up",
            "111110:0",
        ),
        BlockData.State(
            "side_down",
            "111101:0",
        ),
        # Junctions
        BlockData.State(
            "junction_left",
            "100011:0",
            "010011:180",
            "001011:90",
            "000111:-90",
        ),
        BlockData.State(
            "junction_up",
            "110010:0",
            "001110:90",
        ),
        BlockData.State(
            "junction_down",
            "110001:0",
            "001101:90",
        ),
        # Edges
        BlockData.State(
            "edge_left",
            "101011:0",
            "100111:-90",
            "011011:90",
            "010111:180",
        ),
        BlockData.State(
            "edge_up",
            "111010:0",
            "110110:180",
            "101110:-90",
            "011110:90",
        ),
        BlockData.State(
            "edge_down",
            "111001:0",
            "110101:180",
            "101101:-90",
            "011101:90",
        ),
        # Partials (That didn't fit a category)
        BlockData.State(
            "partial_horizontal",
            "111100:0",
        ),
        BlockData.State(
            "partial_vertical",
            "110011:0",
            "001111:90",
        ),
        BlockData.State(
            "partial_left",
            "111000:0",
            "110100:180",
            "101100:-90",
            "011100:90",
        ),
        # Cross
        BlockData.State(
            "cross",
            "111111:0",
        ),
    )


class Radiator(Block):
    """
    :yellow [☶ Description]
    TODO
    """

    base = BlockData.Base.CONTAINER
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "iron_block"),
    ]
    tags = [
        BlockData.Uses.GUI,
        BlockData.Uses.BRIGHTNESS_FIX,
        BlockData.Uses.TIMER,
    ]
    blockstates = BlockData.BlockStates(
        "<manual>",
        BlockData.State("off"),
        BlockData.State("on"),
    )


class SurveillanceCamera(Block):
    """
    :yellow [☶ Description]
    TODO
    """

    base = BlockData.Base.NONE
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.WALL_NORMAL
    recipe = [
        BlockData.RecipeEntry("block", "iron_block"),
    ]
    tags = [
        BlockData.Uses.PLACE,
        BlockData.Uses.TICK,
        BlockData.Uses.NO_BASE,
        BlockData.Uses.TIMER,
    ]
    blockstates = BlockData.BlockStates(
        "@self",
        BlockData.State("default"),
        BlockData.State("stand"),
        BlockData.State("camera"),
    )


class SecurityMonitor(Block):
    """
    :yellow [☶ Description]
    TODO
    """

    base = BlockData.Base.NONE
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.WALL_NORMAL
    recipe = [
        BlockData.RecipeEntry("block", "iron_block"),
    ]
    tags = [
        BlockData.Uses.PLACE,
        BlockData.Uses.NO_BASE,
        BlockData.Uses.CUSTOM_BASE,
    ]
    blockstates = BlockData.BlockStates(
        "@self",
        BlockData.State("default"),
        BlockData.State("off"),
        BlockData.State("disabled"),
    )


# ------


class Padlock(Item):
    """
    :yellow [☶ Description]
    TODO
    """

    base = ItemData.Base.INTERACTIVE
    recipe = [
        BlockData.RecipeEntry("block", "iron_block"),
    ]
    params = lambda *_: NBT({})


class Key(ItemVariant):
    """
    :yellow [☶ Description]
    TODO
    """

    material = BlockMaterials.WOOL

    base = ItemData.Base.INTERACTIVE
    recipe = [
        BlockData.RecipeEntry("block", "iron_block"),
    ]
    params = lambda material, index: NBT(
        {"key": {"name": material.name, "index": index}}
    )
