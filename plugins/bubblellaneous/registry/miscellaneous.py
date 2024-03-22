from plugins.bubblellaneous.internal import Block, BlockData, BlockMaterials
from plugins.bubblellaneous.internal.unit.block import BlockType
from plugins.bubblellaneous.internal.unit.item import Item, ItemData
from plugins.bubblellaneous.internal.unit.variant import BlockVariant
from plugins.utils.nbt import NBT


class WindowBoards(BlockVariant):
    """
    :yellow [☶ Description]
    TODO
    """

    material = BlockMaterials.SOLID

    base = BlockData.Base.VOID
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.WALL_NORMAL
    recipe = [
        BlockData.RecipeEntry("block", "[base]", 4),
    ]
    tags = [BlockData.Uses.BLOCKSTATES]
    blockstates = BlockData.BlockStates(
        "@self",
        BlockData.State("default"),
        BlockData.State("left", "~~01~~"),
        BlockData.State("right", "~~10~~"),
        BlockData.State("middle", "~~11~~"),
    )


class Hatch(Block):
    """
    :yellow [☶ Description]
    TODO
    """

    base = BlockData.Base.VOID
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.NONE
    recipe = [
        BlockData.RecipeEntry("block", "iron_ingot", 4),
    ]
    tags = [
        BlockData.Uses.PLACE,
        BlockData.Uses.NO_BASE,
        BlockData.Uses.CUSTOM_BASE,
        BlockData.Uses.TIMER,
    ]
    blockstates = BlockData.BlockStates(
        "<manual>",
        BlockData.State("default"),
        BlockData.State("rim"),
        BlockData.State("latch"),
    )


class TrafficBarrier(Block):
    """
    :yellow [☶ Description]
    TODO
    """

    children = ["block/mossy_traffic_barrier"]
    base = BlockData.Base.UPPER
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.PLAYER_PRECISE
    recipe = [
        BlockData.RecipeEntry("block", "oak_planks", 6),
    ]
    tags = []


class MossyTrafficBarrier(Block):
    """
    :yellow [☶ Description]
    TODO
    """

    is_unlisted = True
    base = BlockData.Base.UPPER
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.PLAYER_PRECISE
    recipe = [
        BlockData.RecipeEntry("block", "oak_planks", 6),
        BlockData.RecipeEntry("block", "moss", 1),
    ]
    tags = []


class Pole(Block):
    """
    :yellow [☶ Description]
    TODO
    """

    base = BlockData.Base.CHAIN
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.NONE
    recipe = [
        BlockData.RecipeEntry("block", "chain", 1),
    ]
    tags = []


class RoadSign(Block):
    """
    :yellow [☶ Description]
    TODO
    """

    base = BlockData.Base.CHAIN
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "chain", 1),
        BlockData.RecipeEntry("block", "white_banner", 1),
    ]
    tags = []


class NoEntranceRoadSign(RoadSign):
    children = [
        "block/park_road_sign",
        "block/arrow_down_road_sign",
        "block/arrow_up_road_sign",
        "block/arrow_left_road_sign",
        "block/arrow_right_road_sign",
    ]


class ParkRoadSign(RoadSign):
    is_unlisted = True


class ArrowDownRoadSign(RoadSign):
    is_unlisted = True


class ArrowUpRoadSign(RoadSign):
    is_unlisted = True


class ArrowLeftRoadSign(RoadSign):
    is_unlisted = True


class ArrowRightRoadSign(RoadSign):
    is_unlisted = True


class CallBell(Block):
    """
    :yellow [☶ Description]
    TODO
    """

    base = BlockData.Base.VOID
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.NONE
    recipe = [
        BlockData.RecipeEntry("item", "iron_ingot", 1),
    ]
    tags = [
        BlockData.Uses.PLACE,
        BlockData.Uses.NO_BASE,
        BlockData.Uses.CUSTOM_BASE,
    ]


class Box(Block):
    """
    :yellow [☶ Description]
    TODO
    """

    base = BlockData.Base.CONTAINER
    sound = BlockData.Sound.WOOL
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("item", "leather", 8),
    ]
    tags = [BlockData.Uses.BRIGHTNESS_FIX]


class VendingMachine(Block):
    """
    :yellow [☶ Description]
    TODO
    """

    base = BlockData.Base.SOLID
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "glass", 1),
        BlockData.RecipeEntry("block", "iron_ingot", 2),
    ]
    tags = [
        BlockData.Uses.BRIGHTNESS_FIX,
        BlockData.Uses.BLOCKSTATES,
    ]
    blockstates = BlockData.BlockStates(
        "@self",
        BlockData.State("default"),
        BlockData.State("single_left", "~~1000"),
        BlockData.State("single_middle", "~~1100"),
        BlockData.State("single_right", "~~0100"),
        BlockData.State("top_single", "~~0001"),
        BlockData.State("top_left", "~~1001"),
        BlockData.State("top_middle", "~~1101"),
        BlockData.State("top_right", "~~0101"),
        BlockData.State("middle_single", "~~0011"),
        BlockData.State("middle_left", "~~1011"),
        BlockData.State("middle_middle", "~~1111"),
        BlockData.State("middle_right", "~~0111"),
        BlockData.State("bottom_single", "~~0010"),
        BlockData.State("bottom_left", "~~1010"),
        BlockData.State("bottom_middle", "~~1110"),
        BlockData.State("bottom_right", "~~0110"),
    )


class Megaphone(Item):
    """
    :yellow [☶ Description]
    TODO
    """

    base = ItemData.Base.INTERACTIVE
    recipe = [
        BlockData.RecipeEntry("item", "iron_ingot", 1),
    ]
    params = lambda *_: NBT({})


class Cup(BlockVariant):
    """
    :yellow [☶ Description]
    TODO
    """

    material = BlockMaterials.DYE

    base = BlockData.Base.VOID
    sound = BlockData.Sound.WOOL
    facing = BlockData.Facing.PLAYER_PRECISE
    recipe = [
        BlockData.RecipeEntry("item", "[color]", 3),
    ]
    tags = []


class Clipboard(Block):
    """
    :yellow [☶ Description]
    TODO
    """

    base = BlockData.Base.VOID
    sound = BlockData.Sound.WOOL
    facing = BlockData.Facing.PLAYER_PRECISE
    recipe = [
        BlockData.RecipeEntry("item", "paper", 1),
    ]
    tags = []


class Plate(Block):
    """
    :yellow [☶ Description]
    TODO
    """

    block_type = BlockType.shelf(amount=1, offset=-0.45)

    base = BlockData.Base.VOID
    sound = BlockData.Sound.WOOL
    facing = BlockData.Facing.PLAYER_PRECISE
    recipe = [
        BlockData.RecipeEntry("block", "quartz_block", 1),
    ]
    tags = [BlockData.Uses.PLACE]


class Speakers(Block):
    """
    :yellow [☶ Description]
    TODO
    """

    base = BlockData.Base.SOLID
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "black_wool", 1),
    ]
    tags = [BlockData.Uses.BRIGHTNESS_FIX]
