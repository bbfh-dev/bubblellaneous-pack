from plugins.bubblellaneous.internal import (Block, BlockData, BlockMaterials,
                                             BlockType)
from plugins.bubblellaneous.internal.unit.variant import BlockVariant


class BubbleBench(Block):
    """
    :yellow [☶ Description]
    Used for obtaining all custom blocks & items.

    :green [☄ Instructions]
    Open the block, use compass inside to view all help tooltips.
    """

    base = BlockData.Base.CONTAINER
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "crafting_table"),
        BlockData.RecipeEntry("item", "glass_bottle"),
    ]
    tags = [
        BlockData.Uses.GUI,
        BlockData.Uses.BRIGHTNESS_FIX,
    ]


class Table(BlockVariant):
    """
    :yellow [☶ Description]
    Empty.

    :light_purple [⇄ Connectivity]
    Can connect to other tables.
    """

    material = BlockMaterials.SOLID

    base = BlockData.Base.UPPER
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.NONE
    recipe = [
        BlockData.RecipeEntry("block", "[base]", 1),
    ]
    tags = [
        BlockData.Uses.PLACE,
        BlockData.Uses.BLOCKSTATES,
    ]
    blockstates = BlockData.BlockStates(
        "@self",
        BlockData.State("default"),
        BlockData.State("side", "0100~~:0", "1000~~:180", "0010~~:-90", "0001~~:90"),
        BlockData.State("corner", "1010~~:0", "1001~~:-90", "0110~~:90", "0101~~:180"),
        BlockData.State("middle", "11~~~~", "~~11~~"),
    )


class Shelf(BlockVariant):
    """
    :yellow [☶ Description]
    Can store a single item stack.
    """

    material = BlockMaterials.SOLID
    block_type = BlockType.shelf(amount=1)

    base = BlockData.Base.VOID
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.WALL_NORMAL
    recipe = [
        BlockData.RecipeEntry("block", "[base]", 1),
    ]
    tags = [
        BlockData.Uses.PLACE,
    ]


class Cabinet(BlockVariant):
    """
    :yellow [☶ Description]
    A regular container (27 slots).
    """

    material = BlockMaterials.SOLID

    base = BlockData.Base.CONTAINER
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "[base]", 1),
    ]
    tags = [
        BlockData.Uses.BRIGHTNESS_FIX,
    ]


class Drawer(BlockVariant):
    """
    :yellow [☶ Description]
    Empty.
    """

    material = BlockMaterials.SOLID

    base = BlockData.Base.UPPER
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "[base]", 1),
    ]
    tags = []


class Cupboard(BlockVariant):
    """
    :yellow [☶ Description]
    Can store up to 2 item stacks.
    """

    material = BlockMaterials.SOLID
    block_type = BlockType.shelf(amount=2)

    base = BlockData.Base.SOLID
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "[base]", 1),
    ]
    tags = [
        BlockData.Uses.PLACE,
        BlockData.Uses.BRIGHTNESS_FIX,
    ]


class Bench(BlockVariant):
    """
    :yellow [☶ Description]
    A seat.
    """

    material = BlockMaterials.SOLID
    block_type = BlockType.seat(width=0.8, height=0.6)

    base = BlockData.Base.TRIPWIRE
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "[base]", 1),
    ]
    tags = [
        BlockData.Uses.PLACE,
    ]


class Couch(BlockVariant):
    """
    :yellow [☶ Description]
    A seat.

    :light_purple [⇄ Connectivity]
    Can connect to other couches with corners support.
    """

    material = BlockMaterials.WOOL
    block_type = BlockType.seat(width=0.8, height=0.5)

    base = BlockData.Base.TRIPWIRE
    sound = BlockData.Sound.WOOL
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "[color]", 6),
    ]
    tags = [
        BlockData.Uses.PLACE,
        BlockData.Uses.BLOCKSTATES,
    ]
    blockstates = BlockData.BlockStates(
        "@self",
        BlockData.State("default"),
        BlockData.State("left", "0010~~"),
        BlockData.State("right", "0001~~"),
        BlockData.State("middle", "0011~~"),
        BlockData.State("corner", "1010~~:90", "1001~~:0"),
        BlockData.State("slab", "~1~~~~"),
    )


class Stool(BlockVariant):
    """
    :yellow [☶ Description]
    A seat.
    """

    material = BlockMaterials.WOOD
    block_type = BlockType.seat(width=0.8, height=0.6)

    base = BlockData.Base.VOID
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.NONE
    recipe = [
        BlockData.RecipeEntry("block", "[base]", 1),
    ]
    tags = [
        BlockData.Uses.PLACE,
    ]


class Barstool(BlockVariant):
    """
    :yellow [☶ Description]
    A seat.
    """

    material = BlockMaterials.WOOD
    block_type = BlockType.seat(width=0.8, height=0.7)

    base = BlockData.Base.VOID
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.NONE
    recipe = [
        BlockData.RecipeEntry("block", "[base]", 1),
    ]
    tags = [
        BlockData.Uses.PLACE,
    ]


class DinningChair(BlockVariant):
    """
    :yellow [☶ Description]
    A seat.
    """

    material = BlockMaterials.WOOD_WITH_WOOL
    block_type = BlockType.seat(width=0.8, height=0.4)

    base = BlockData.Base.VOID
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "[base]", 1),
        BlockData.RecipeEntry("block", "[color]", 2),
    ]
    tags = [
        BlockData.Uses.PLACE,
    ]


class Blinds(BlockVariant):
    """
    :yellow [☶ Description]
    Empty.
    """

    material = BlockMaterials.SOLID

    base = BlockData.Base.VOID
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.WALL_NORMAL
    recipe = [
        BlockData.RecipeEntry("block", "[base]", 1),
    ]
    tags = []


class KitchenCabinet(BlockVariant):
    """
    :yellow [☶ Description]
    A regular container (27 slots).
    """

    material = BlockMaterials.SOLID

    base = BlockData.Base.CONTAINER
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "[base]", 1),
    ]
    tags = [
        BlockData.Uses.BRIGHTNESS_FIX,
    ]


class Fridge(Block):
    """
    :yellow [☶ Description]
    A regular container (27 slots).

    :light_purple [⇄ Connectivity]
    Can connect to other fridges placed on top.
    """

    base = BlockData.Base.CONTAINER
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "iron_block", 4),
    ]
    tags = [
        BlockData.Uses.BLOCKSTATES,
        BlockData.Uses.BRIGHTNESS_FIX,
    ]
    blockstates = BlockData.BlockStates(
        "@self",
        BlockData.State("default"),
        BlockData.State("freezer", "~~~~1~"),
    )


class Washer(Block):
    """
    :yellow [☶ Description]
    Place a block of water on top to refill. Cleans color from leather armor.
    """

    base = BlockData.Base.HOPPER
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "iron_block", 4),
        BlockData.RecipeEntry("item", "bucket"),
    ]
    tags = [
        BlockData.Uses.TICK,
    ]
    blockstates = BlockData.BlockStates(
        "@self",
        BlockData.State("default"),
        BlockData.State("full"),
    )


class Trashcan(Block):
    """
    :yellow [☶ Description]
    Empty.
    """

    base = BlockData.Base.DRIPSTONE
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.NONE
    recipe = [
        BlockData.RecipeEntry("block", "iron_block", 4),
    ]
    tags = [
        BlockData.Uses.PLACE,
        BlockData.Uses.BRIGHTNESS_FIX,
    ]


class TableLamp(BlockVariant):
    """
    :yellow [☶ Description]
    A light source.
    """

    material = BlockMaterials.WOOL
    block_type = BlockType.light(light_level=15)

    base = BlockData.Base.NONE
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.NONE
    recipe = [
        BlockData.RecipeEntry("block", "[color]", 4),
    ]
    tags = [
        BlockData.Uses.PLACE,
        BlockData.Uses.NO_BASE,
    ]


class StreetLight(BlockVariant):
    """
    :yellow [☶ Description]
    A light source.
    """

    material = BlockMaterials.SOLID
    block_type = BlockType.light(light_level=15)

    base = BlockData.Base.NONE
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.NORMAL
    recipe = [
        BlockData.RecipeEntry("block", "[base]", 1),
    ]
    tags = [
        BlockData.Uses.PLACE,
        BlockData.Uses.BLOCKSTATES,
        BlockData.Uses.NO_BASE,
    ]
    blockstates = BlockData.BlockStates(
        "!#no_solid_collision",
        BlockData.State("default"),
        BlockData.State("wall", "~1~~~~"),
    )


class DeskLamp(BlockVariant):
    """
    :yellow [☶ Description]
    A light source.
    """

    material = BlockMaterials.WOOL
    block_type = BlockType.light(light_level=15)

    base = BlockData.Base.NONE
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "[color]", 4),
        BlockData.RecipeEntry("item", "glowstone_dust"),
    ]
    tags = [
        BlockData.Uses.PLACE,
        BlockData.Uses.NO_BASE,
    ]


class UpholsteryCouch(BlockVariant):
    """
    :yellow [☶ Description]
    A seat.

    :light_purple [⇄ Connectivity]
    Can connect to other couches to the left/right of it.
    """

    material = BlockMaterials.WOOD_WITH_WOOL
    block_type = BlockType.seat(width=0.9, height=0.5)

    base = BlockData.Base.TRIPWIRE
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "[base]", 1),
        BlockData.RecipeEntry("block", "[color]", 6),
    ]
    tags = [
        BlockData.Uses.PLACE,
        BlockData.Uses.BLOCKSTATES,
    ]
    blockstates = BlockData.BlockStates(
        "@self",
        BlockData.State("default"),
        BlockData.State("left", "~~01~~"),
        BlockData.State("right", "~~10~~"),
        BlockData.State("middle", "~~11~~"),
    )


class FloorLamp(BlockVariant):
    """
    :yellow [☶ Description]
    A light source.
    """

    material = BlockMaterials.WOOL
    block_type = BlockType.light(light_level=15)

    base = BlockData.Base.VOID
    sound = BlockData.Sound.WOOL
    facing = BlockData.Facing.NONE
    recipe = [
        BlockData.RecipeEntry("item", "glowstone_dust"),
        BlockData.RecipeEntry("block", "[color]", 4),
    ]
    tags = [
        BlockData.Uses.PLACE,
        BlockData.Uses.NO_BASE,
    ]


class Curtains(Block):
    """
    :yellow [☶ Description]
    Sneak+Click to open/close.

    :light_purple [⇄ Connectivity]
    Can connect to other curtains.
    """

    base = BlockData.Base.VOID
    sound = BlockData.Sound.WOOL
    facing = BlockData.Facing.WALL_NORMAL
    recipe = [
        BlockData.RecipeEntry("block", "red_wool", 6),
    ]
    tags = [
        BlockData.Uses.PLACE,
        BlockData.Uses.NO_BASE,
        BlockData.Uses.CUSTOM_BASE,
    ]
    blockstates = BlockData.BlockStates(
        "@self",
        BlockData.State("top_closed"),
        BlockData.State("top_left"),
        BlockData.State("top_right"),
        BlockData.State("bottom_closed"),
        BlockData.State("bottom_left"),
        BlockData.State("bottom_right"),
        BlockData.State("middle"),
        BlockData.State("empty"),
    )


class Sink(BlockVariant):
    """
    :yellow [☶ Description]
    Click to toggle on/off.
    """

    material = BlockMaterials.SOLID

    base = BlockData.Base.UPPER
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.WALL_NORMAL
    recipe = [
        BlockData.RecipeEntry("block", "[base]", 1),
    ]
    tags = [
        BlockData.Uses.PLACE,
        BlockData.Uses.TICK,
    ]
    blockstates = BlockData.BlockStates(
        "<manual>",
        BlockData.State("default"),
        BlockData.State("water"),
    )


class Toilet(BlockVariant):
    """
    :yellow [☶ Description]
    A seat.
    """

    material = BlockMaterials.SOLID
    block_type = BlockType.seat(width=0.6, height=0.51)

    base = BlockData.Base.TRIPWIRE
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "[base]", 1),
    ]
    tags = [BlockData.Uses.PLACE]
