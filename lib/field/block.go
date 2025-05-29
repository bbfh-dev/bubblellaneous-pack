package field

const (
	BASE_NONE      = "air"
	BASE_CONTAINER = "barrel[facing=up]"
	BASE_HOPPER    = "hopper"
	BASE_UPPER     = "petrified_oak_slab[type=top]"
	BASE_LOWER     = "petrified_oak_slab[type=bottom]"
	BASE_SOLID     = "petrified_oak_slab[type=double]"
	BASE_TRIPWIRE  = "tripwire"
	BASE_DRIPSTONE = "pointed_dripstone[thickness=tip,vertical_direction=up,waterlogged=false]"
	BASE_CHAIN     = "chain[axis=y]"
	BASE_VOID      = "structure_void"
	BASE_REDSTONE  = "redstone_lamp"

	SOUND_INDUSTRIAL = "industrial"
	SOUND_WOOD       = "wood"
	SOUND_WOOL       = "wool"

	FACING_NONE             = "none"
	FACING_PLAYER           = "player"
	FACING_PLAYER_PRECISE   = "player_precise"
	FACING_NORMAL           = "normal"
	FACING_WALL_NORMAL      = "wall_normal"
	FACING_ONLY_WALL_NORMAL = "only_wall_normal"
	FACING_DOOR             = "door"

	USE_GUI             = "--local.uses.gui"
	USE_TICK            = "--local.uses.tick"
	USE_BRIGHTNESS_FIX  = "--local.uses.brightness_fix"
	USE_PLACE           = "--local.uses.place"
	USE_BLOCKSTATES     = "--local.uses.blockstates"
	USE_NO_BASE         = "--local.uses.no_base"
	USE_CUSTOM_BASE     = "--local.uses.custom_base"
	USE_TIMER           = "--local.uses.timer"
	USE_BLOCKSTATE_HOOK = "--local.uses.blockstate_callback"
)
