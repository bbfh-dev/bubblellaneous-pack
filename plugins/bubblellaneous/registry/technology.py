from plugins.bubblellaneous.internal import (Block, BlockData, BlockMaterials,
                                             Item, ItemData)
from plugins.bubblellaneous.internal.unit.variant import (BlockVariant,
                                                          ItemVariant)
from plugins.utils.nbt import NBT


class Ladder(BlockVariant):
    """
    :yellow [☶ Description]
    Right Click to latch onto the ladder.
    Once attached you can go forward/backwards to climb up/down.
    Sneak to get off, you get teleported on top of a block in-front if you're close enough.
    """

    material = BlockMaterials.SOLID

    base = BlockData.Base.VOID
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.WALL_NORMAL
    recipe = [
        BlockData.RecipeEntry("block", "ladder"),
        BlockData.RecipeEntry("block", "[base]", 4),
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
    Empty.
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
    Right Click to open/close.

    :light_purple [⇄ Connectivity]
    Can connect to other rising doors.
    """

    material = BlockMaterials.SOLID

    base = BlockData.Base.NONE
    sound = BlockData.Sound.WOOD
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "[base]", 4),
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
    Empty.

    :light_purple [⇄ Connectivity]
    Can connect to other pipes in all 6 directions.
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
    Melts snow/ice blocks in a 5 block radius.
    Radiates the heat through pipes to cover larger areas.
    """

    base = BlockData.Base.CONTAINER
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "iron_block"),
        BlockData.RecipeEntry("block", "copper_block"),
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
    Used alongside with Security Monitor for players to spectate a certain area.
    """

    base = BlockData.Base.NONE
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.WALL_NORMAL
    recipe = [
        BlockData.RecipeEntry("item", "iron_ingot"),
        BlockData.RecipeEntry("item", "ender_eye"),
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
    The name of the item represents the name used for identifying camera. Use an anvil to rename.
    Right Click on a camera to link, place and Right Click to spectate. Once spectating Sneak to leave the camera.
    """

    base = BlockData.Base.NONE
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.WALL_NORMAL
    recipe = [
        BlockData.RecipeEntry("item", "iron_ingot", 2),
        BlockData.RecipeEntry("block", "tinted_glass"),
    ]
    tags = [
        BlockData.Uses.PLACE,
        BlockData.Uses.NO_BASE,
        BlockData.Uses.CUSTOM_BASE,
    ]
    blockstates = BlockData.BlockStates(
        "<manual>",
        BlockData.State("default"),
        BlockData.State("off"),
        BlockData.State("disabled"),
    )


class Padlock(Item):
    """
    :yellow [☶ Description]
    Right Click while looking at a door to lock it.
    The first key to be used on the padlock is going to be the key required to unlock it in the future.
    """

    base = ItemData.Base.INTERACTIVE
    recipe = [
        BlockData.RecipeEntry("item", "iron_ingot", 4),
    ]
    params = lambda *_: {}


class Key(ItemVariant):
    """
    :yellow [☶ Description]
    Empty.
    """

    material = BlockMaterials.DYE

    base = ItemData.Base.INTERACTIVE
    recipe = [
        BlockData.RecipeEntry("item", "iron_ingot"),
        BlockData.RecipeEntry("item", "[color]"),
    ]
    params = lambda material, index: {"key": {"name": material.name, "index": index}}


class KeypadLock(Block):
    """
    :yellow [☶ Description]
    Use the keys in-front of the block to interact.
    The first password to be entered is going to be saved as credentials for future unlocking.
    Emits redstone signal when unlocked.
    """

    base = BlockData.Base.SOLID
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "iron_block"),
    ]
    tags = [
        BlockData.Uses.PLACE,
        BlockData.Uses.BRIGHTNESS_FIX,
        BlockData.Uses.TIMER,
    ]


class RetinaScanner(Block):
    """
    :yellow [☶ Description]
    The first player to interact with the block will be saved as credentials for future unlocking.
    You can equip a player head to impersonate another player.
    Fails to scan retina if player is wearing a mask (mob head).
    Emits redstone signal when unlocked.
    """

    base = BlockData.Base.CONTAINER
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "iron_block"),
        BlockData.RecipeEntry("item", "spyglass"),
    ]
    tags = [
        BlockData.Uses.GUI,
        BlockData.Uses.BRIGHTNESS_FIX,
        BlockData.Uses.TIMER,
    ]
    blockstates = BlockData.BlockStates(
        "<manual>",
        BlockData.State("default"),
        BlockData.State("scan"),
        BlockData.State("open"),
        BlockData.State("error"),
    )


class ItemScanner(Block):
    """
    :yellow [☶ Description]
    The first item to be used will be saved as credentials for future unlocking.
    Uses both item id and tag to verify the item, supports custom/modded items.
    Emits redstone signal when unlocked.
    """

    base = BlockData.Base.CONTAINER
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "iron_block"),
        BlockData.RecipeEntry("block", "hopper"),
    ]
    tags = [
        BlockData.Uses.GUI,
        BlockData.Uses.BRIGHTNESS_FIX,
        BlockData.Uses.TIMER,
    ]
    blockstates = BlockData.BlockStates(
        "<manual>",
        BlockData.State("default"),
        BlockData.State("scan"),
        BlockData.State("open"),
        BlockData.State("error"),
    )


class Computer(Block):
    """
    :yellow [☶ Description]
    Right Click to turn on/off.
    """

    base = BlockData.Base.VOID
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("block", "iron_block"),
        BlockData.RecipeEntry("item", "redstone"),
    ]
    tags = [
        BlockData.Uses.NO_BASE,
        BlockData.Uses.TIMER,
    ]
    blockstates = BlockData.BlockStates(
        "<manual>",
        BlockData.State("default"),
        BlockData.State("boot"),
        BlockData.State("login"),
    )


class Calculator(Block):
    """
    :yellow [☶ Description]
    Empty.
    """

    base = BlockData.Base.VOID
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.PLAYER_PRECISE
    recipe = [
        BlockData.RecipeEntry("item", "iron_ingot"),
        BlockData.RecipeEntry("item", "redstone"),
    ]
    tags = []


class AlarmBlock(Block):
    """
    :yellow [☶ Description]
    Produces a loud (32 block radius) alarm sound when activated by redstone.
    """

    base = BlockData.Base.REDSTONE_ACTIVATED
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.NONE
    recipe = [
        BlockData.RecipeEntry("block", "bell"),
        BlockData.RecipeEntry("item", "redstone"),
    ]
    tags = [
        BlockData.Uses.TICK,
        BlockData.Uses.BRIGHTNESS_FIX,
        BlockData.Uses.TIMER,
    ]


class LaserBlock(Block):
    """
    :yellow [☶ Description]
    Looks for players 5 blocks in front of itself.
    Can be hidden behind a 1-block thick wall, however can be obstructed by blocks placed any further than that.
    """

    base = BlockData.Base.SOLID
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.NORMAL
    recipe = [
        BlockData.RecipeEntry("block", "glass"),
        BlockData.RecipeEntry("item", "redstone"),
    ]
    tags = [
        BlockData.Uses.TICK,
        BlockData.Uses.BRIGHTNESS_FIX,
        BlockData.Uses.TIMER,
    ]


class Nanoglasses(Item):
    """
    :yellow [☶ Description]
    Right Click to equip. When equipped you can see laser rays.
    """

    base = ItemData.Base.INTERACTIVE
    recipe = [
        BlockData.RecipeEntry("item", "iron_ingot", 4),
        BlockData.RecipeEntry("item", "redstone"),
    ]
    params = lambda *_: {}


class Crowbar(Item):
    """
    :yellow [☶ Description]
    Acts as a stone pickaxe.
    """

    base = ItemData.Base.PICKAXE
    recipe = [
        BlockData.RecipeEntry("item", "iron_ingot", 2),
    ]
    params = lambda *_: {}


class Flashlight(Item):
    """
    :yellow [☶ Description]
    Right Click to turn on/off.
    Emits light up to 32 blocks ahead. Requires a configurable amount of charge, becomes more dim as it discharges.
    When the battery level is 0 it will attempt to use a Battery item in player's inventory.
    """

    base = ItemData.Base.INTERACTIVE
    recipe = [
        BlockData.RecipeEntry("block", "lantern", 1),
        BlockData.RecipeEntry("item", "redstone"),
    ]
    params = lambda *_: {"battery": 12000, "max_charge": 12000, "is_turned_on": 0}
    limit_attack_speed = True


class Battery(Item):
    """
    :yellow [☶ Description]
    Empty.
    """

    base = ItemData.Base.NORMAL
    recipe = [
        BlockData.RecipeEntry("item", "redstone"),
    ]
    params = lambda *_: {}


class MotionSensor(Block):
    """
    :yellow [☶ Description]
    Saves the player that placed it as its owner.
    When a player is detected nearby it will alert with a loud (32 block radius) sound and notify the owner.
    """

    base = BlockData.Base.VOID
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.NONE
    recipe = [
        BlockData.RecipeEntry("block", "glass"),
        BlockData.RecipeEntry("item", "redstone"),
    ]
    tags = [
        BlockData.Uses.TICK,
        BlockData.Uses.TIMER,
        BlockData.Uses.PLACE,
    ]
    blockstates = BlockData.BlockStates(
        "<manual>",
        BlockData.State("default"),
        BlockData.State("triggered"),
    )


class ElectricalBox(Block):
    """
    :yellow [☶ Description]
    Right Click to turn on/off.
    """

    base = BlockData.Base.VOID
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.WALL_NORMAL
    recipe = [
        BlockData.RecipeEntry("item", "iron_ingot", 2),
        BlockData.RecipeEntry("item", "redstone"),
    ]
    tags = [
        BlockData.Uses.NO_BASE,
        BlockData.Uses.CUSTOM_BASE,
        BlockData.Uses.PLACE,
    ]
    blockstates = BlockData.BlockStates(
        "<manual>",
        BlockData.State("default"),
        BlockData.State("disabled"),
    )


class SafeBlock(Block):
    """
    :yellow [☶ Description]
    A container block (27 slots) that gets locked when it has no redstone signal.
    When activated with redstone it opens for 30 ticks, can only close if nobody is currently interacting with it.
    """

    base = BlockData.Base.REDSTONE_ACTIVATED
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.PLAYER
    recipe = [
        BlockData.RecipeEntry("item", "iron_ingot", 2),
        BlockData.RecipeEntry("item", "redstone"),
    ]
    tags = [
        BlockData.Uses.TICK,
        BlockData.Uses.BRIGHTNESS_FIX,
        BlockData.Uses.TIMER,
    ]
    blockstates = BlockData.BlockStates(
        "<manual>",
        BlockData.State("default"),
        BlockData.State("open"),
    )


class Telescope(Block):
    """
    :yellow [☶ Description]
    Right Click to use. You can navigate using your regular controls.
    To exit go all the way backwards and sneak.
    """

    base = BlockData.Base.VOID
    sound = BlockData.Sound.INDUSTRIAL
    facing = BlockData.Facing.PLAYER_PRECISE
    recipe = [
        BlockData.RecipeEntry("item", "spyglass"),
    ]
    tags = [
        BlockData.Uses.PLACE,
        BlockData.Uses.NO_BASE,
        BlockData.Uses.CUSTOM_BASE,
    ]
    blockstates = BlockData.BlockStates(
        "<manual>",
        BlockData.State("default"),
        BlockData.State("stand"),
        BlockData.State("optics"),
    )
