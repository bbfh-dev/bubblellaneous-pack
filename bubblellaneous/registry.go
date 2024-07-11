package bubblellaneous

import (
	"github.com/bbfh-dev/bubblellaneous-pack/bubblellaneous/unit"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/field"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/nbt"
)

var Furniture = []unit.Unit{
	unit.NewBlock(
		"bubble_bench",
		field.BASE_CONTAINER,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "crafting_table", 1),
			field.NewRecipeEntry("item", "glass_bottle", 1),
		},
		field.USE_GUI,
		field.USE_BRIGHTNESS_FIX,
	),
	unit.NewVariant(
		unit.NewBlock(
			"table",
			field.BASE_UPPER,
			field.SOUND_WOOD,
			field.FACING_NONE,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
			field.USE_PLACE,
			field.USE_BLOCKSTATES,
		).WithBlockstates(
			"@self", field.NewBlockState("default"),
			field.NewBlockState("side", "0100~~:0", "1000~~:180", "0010~~:-90", "0001~~:90"),
			field.NewBlockState("corner", "1010~~:0", "1001~~:-90", "0110~~:90", "0101~~:180"),
			field.NewBlockState("middle", "11~~~~", "~~11~~"),
		),
		field.SOLID_MATERIAL,
	),
	unit.NewVariant(
		unit.NewBlock(
			"shelf",
			field.BASE_VOID,
			field.SOUND_WOOD,
			field.FACING_WALL_NORMAL,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
			field.USE_PLACE,
		),
		field.SOLID_MATERIAL,
	),
	unit.NewVariant(
		unit.NewBlock(
			"cabinet",
			field.BASE_CONTAINER,
			field.SOUND_WOOD,
			field.FACING_PLAYER,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
			field.USE_BRIGHTNESS_FIX,
		),
		field.SOLID_MATERIAL,
	),
	unit.NewVariant(
		unit.NewBlock(
			"drawer",
			field.BASE_UPPER,
			field.SOUND_WOOD,
			field.FACING_PLAYER,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
		),
		field.SOLID_MATERIAL,
	),
	unit.NewVariant(
		unit.NewBlock(
			"cupboard",
			field.BASE_SOLID,
			field.SOUND_WOOD,
			field.FACING_PLAYER,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
			field.USE_PLACE,
			field.USE_BRIGHTNESS_FIX,
		),
		field.SOLID_MATERIAL,
	),
	unit.NewVariant(
		unit.NewBlock(
			"bench",
			field.BASE_TRIPWIRE,
			field.SOUND_WOOD,
			field.FACING_PLAYER,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
			field.USE_PLACE,
		),
		field.SOLID_MATERIAL,
	),
	unit.NewVariant(
		unit.NewBlock(
			"couch",
			field.BASE_TRIPWIRE,
			field.SOUND_WOOL,
			field.FACING_PLAYER,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[color]", 6),
			},
			field.USE_PLACE,
			field.USE_BLOCKSTATES,
		).WithBlockstates(
			"@self", field.NewBlockState("default"),
			field.NewBlockState("left", "0010~~"),
			field.NewBlockState("right", "0001~~"),
			field.NewBlockState("middle", "0011~~"),
			field.NewBlockState("corner", "1010~~:90", "1001~~:0"),
			field.NewBlockState("slab", "~1~~~~"),
		),
		field.WOOL_MATERIAL,
	),
	unit.NewVariant(
		unit.NewBlock(
			"stool",
			field.BASE_VOID,
			field.SOUND_WOOD,
			field.FACING_NONE,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
			field.USE_PLACE,
		),
		field.WOOD_MATERIAL,
	),
	unit.NewVariant(
		unit.NewBlock(
			"barstool",
			field.BASE_VOID,
			field.SOUND_WOOD,
			field.FACING_NONE,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
			field.USE_PLACE,
		),
		field.WOOD_MATERIAL,
	),
	unit.NewVariant(
		unit.NewBlock(
			"dinning_chair",
			field.BASE_VOID,
			field.SOUND_WOOD,
			field.FACING_PLAYER,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
				field.NewRecipeEntry("block", "[color]", 2),
			},
			field.USE_PLACE,
		),
		field.WOOD_WITH_WOOL_MATERIAL,
	),
	unit.NewVariant(
		unit.NewBlock(
			"blinds",
			field.BASE_VOID,
			field.SOUND_WOOD,
			field.FACING_WALL_NORMAL,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
		),
		field.SOLID_MATERIAL,
	),
	unit.NewVariant(
		unit.NewBlock(
			"kitchen_cabinet",
			field.BASE_CONTAINER,
			field.SOUND_WOOD,
			field.FACING_PLAYER,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
			field.USE_BRIGHTNESS_FIX,
		),
		field.SOLID_MATERIAL,
	),
	unit.NewBlock(
		"fridge",
		field.BASE_CONTAINER,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "iron_block", 4),
		},
		field.USE_BLOCKSTATES,
		field.USE_BRIGHTNESS_FIX,
	).WithBlockstates(
		"@self", field.NewBlockState("default"),
		field.NewBlockState("freezer", "~~~~1~"),
	),
	unit.NewBlock(
		"washer",
		field.BASE_HOPPER,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "iron_block", 4),
			field.NewRecipeEntry("item", "bucket", 1),
		},
		field.USE_TICK,
	).WithBlockstates(
		"@self", field.NewBlockState("default"),
		field.NewBlockState("full"),
	),
	unit.NewBlock(
		"trashcan",
		field.BASE_DRIPSTONE,
		field.SOUND_WOOD,
		field.FACING_NONE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "iron_block", 4),
		},
		field.USE_PLACE,
		field.USE_BRIGHTNESS_FIX,
	),
	unit.NewVariant(
		unit.NewBlock(
			"table_lamp",
			field.BASE_NONE,
			field.SOUND_WOOD,
			field.FACING_NONE,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[color]", 4),
			},
			field.USE_PLACE,
			field.USE_NO_BASE,
		),
		field.WOOL_MATERIAL,
	),
	unit.NewVariant(
		unit.NewBlock(
			"street_light",
			field.BASE_NONE,
			field.SOUND_WOOD,
			field.FACING_NORMAL,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
			field.USE_PLACE,
			field.USE_BLOCKSTATES,
			field.USE_NO_BASE,
		).WithBlockstates(
			"!#no_solid_collision", field.NewBlockState("default"),
			field.NewBlockState("wall", "~1~~~~"),
		),
		field.SOLID_MATERIAL,
	),
	unit.NewVariant(
		unit.NewBlock(
			"desk_lamp",
			field.BASE_NONE,
			field.SOUND_WOOD,
			field.FACING_PLAYER,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[color]", 4),
				field.NewRecipeEntry("item", "glowstone_dust", 1),
			},
			field.USE_PLACE,
			field.USE_NO_BASE,
		),
		field.WOOL_MATERIAL,
	),
	unit.NewVariant(
		unit.NewBlock(
			"upholstery_couch",
			field.BASE_TRIPWIRE,
			field.SOUND_WOOD,
			field.FACING_PLAYER,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
				field.NewRecipeEntry("block", "[color]", 6),
			},
			field.USE_PLACE,
			field.USE_BLOCKSTATES,
		).WithBlockstates(
			"@self", field.NewBlockState("default"),
			field.NewBlockState("left", "~~01~~"),
			field.NewBlockState("right", "~~10~~"),
			field.NewBlockState("middle", "~~11~~"),
		),
		field.WOOD_WITH_WOOL_MATERIAL,
	),
	unit.NewVariant(
		unit.NewBlock(
			"floor_lamp",
			field.BASE_VOID,
			field.SOUND_WOOL,
			field.FACING_NONE,
			[]field.RecipeEntry{
				field.NewRecipeEntry("item", "glowstone_dust", 1),
				field.NewRecipeEntry("block", "[color]", 4),
			},
			field.USE_PLACE,
			field.USE_NO_BASE,
		),
		field.WOOL_MATERIAL,
	),
	unit.NewBlock(
		"curtains",
		field.BASE_VOID,
		field.SOUND_WOOL,
		field.FACING_WALL_NORMAL,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "red_wool", 6),
		},
		field.USE_PLACE,
		field.USE_NO_BASE,
		field.USE_CUSTOM_BASE,
	).WithBlockstates(
		"@self", field.NewBlockState("top_closed"),
		field.NewBlockState("top_left"),
		field.NewBlockState("top_right"),
		field.NewBlockState("bottom_closed"),
		field.NewBlockState("bottom_left"),
		field.NewBlockState("bottom_right"),
		field.NewBlockState("middle"),
		field.NewBlockState("empty"),
	),
	unit.NewVariant(
		unit.NewBlock(
			"sink",
			field.BASE_UPPER,
			field.SOUND_WOOD,
			field.FACING_WALL_NORMAL,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
			field.USE_PLACE,
			field.USE_TICK,
		).WithBlockstates(
			"<manual>", field.NewBlockState("default"),
			field.NewBlockState("water"),
		),
		field.SOLID_MATERIAL,
	),
	unit.NewVariant(
		unit.NewBlock(
			"toilet",
			field.BASE_TRIPWIRE,
			field.SOUND_WOOD,
			field.FACING_PLAYER,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
			field.USE_PLACE,
		),
		field.SOLID_MATERIAL,
	),
}

var Food = []unit.Unit{
	unit.NewItem(
		"coffee_cup",
		field.ITEM_DRINK,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "cocoa_beans", 2),
		},
		nbt.Tree(),
	),
	unit.NewItem(
		"cucumber",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "wheat_seeds", 1),
		},
		nbt.Tree(),
	),
	unit.NewItem(
		"grapes",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "wheat_seeds", 1),
		},
		nbt.Tree(),
	),
	unit.NewItem(
		"burger",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "bread", 1),
			field.NewRecipeEntry("item", "cooked_beef", 1),
		},
		nbt.Tree(),
	),
	unit.NewItem(
		"toast",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "bread", 1),
		},
		nbt.Tree(),
	),
	unit.NewItem(
		"tomato",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "wheat_seeds", 1),
		},
		nbt.Tree(),
	),
	unit.NewItem(
		"cheese",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "milk_bucket", 1),
		},
		nbt.Tree(),
	),
	unit.NewItem(
		"chocolate_bar",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "cocoa_beans", 1),
		},
		nbt.Tree(),
	),
	unit.NewItem(
		"donut",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "bread", 1),
			field.NewRecipeEntry("item", "sugar", 1),
		},
		nbt.Tree(),
	),
	unit.NewItem(
		"broccoli",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "wheat_seeds", 1),
		},
		nbt.Tree(),
	),
	unit.NewItem(
		"omelette",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "egg", 1),
		},
		nbt.Tree(),
	),
	unit.NewItem(
		"strawberry",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "wheat_seeds", 1),
		},
		nbt.Tree(),
	),
	unit.NewItem(
		"cereal",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "wheat", 2),
		},
		nbt.Tree(),
	),
	unit.NewVariant(
		unit.NewItem(
			"beer_bottle",
			field.ITEM_DRINK,
			[]field.RecipeEntry{
				field.NewRecipeEntry("item", "glass_bottle", 1),
				field.NewRecipeEntry("item", "[color]", 1),
			},
			nbt.Tree(),
		),
		field.DYE_MATERIAL,
	),
}

var Miscellaneous = []unit.Unit{
	unit.NewVariant(
		unit.NewBlock(
			"window_boards",
			field.BASE_VOID,
			field.SOUND_WOOD,
			field.FACING_WALL_NORMAL,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 4),
			},
			field.USE_BLOCKSTATES,
		).WithBlockstates(
			"@self", field.NewBlockState("default"),
			field.NewBlockState("left", "~~01~~"),
			field.NewBlockState("right", "~~10~~"),
			field.NewBlockState("middle", "~~11~~"),
		),
		field.SOLID_MATERIAL,
	),
	unit.NewBlock(
		"hatch",
		field.BASE_VOID,
		field.SOUND_INDUSTRIAL,
		field.FACING_NONE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "iron_ingot", 4),
		},
		field.USE_PLACE,
		field.USE_NO_BASE,
		field.USE_CUSTOM_BASE,
		field.USE_TIMER,
	).WithBlockstates(
		"<manual>", field.NewBlockState("default"),
		field.NewBlockState("rim"),
		field.NewBlockState("latch"),
	),
	unit.NewBlock(
		"traffic_barrier",
		field.BASE_UPPER,
		field.SOUND_WOOD,
		field.FACING_PLAYER_PRECISE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "oak_planks", 6),
		},
	),
	unit.NewBlock(
		"mossy_traffic_barrier",
		field.BASE_UPPER,
		field.SOUND_WOOD,
		field.FACING_PLAYER_PRECISE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "oak_planks", 6),
			field.NewRecipeEntry("block", "moss_carpet", 1),
		},
	),
	unit.NewBlock(
		"pole",
		field.BASE_CHAIN,
		field.SOUND_INDUSTRIAL,
		field.FACING_NONE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "chain", 1),
		},
	),
	unit.NewBlock(
		"box",
		field.BASE_CONTAINER,
		field.SOUND_WOOL,
		field.FACING_PLAYER,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "leather", 8),
		},
		field.USE_BRIGHTNESS_FIX,
	),
	unit.NewBlock(
		"call_bell",
		field.BASE_VOID,
		field.SOUND_INDUSTRIAL,
		field.FACING_NONE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "iron_ingot", 1),
		},
		field.USE_PLACE,
		field.USE_NO_BASE,
		field.USE_CUSTOM_BASE,
	),
	unit.NewBlock(
		"vending_machine",
		field.BASE_SOLID,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "glass", 1),
			field.NewRecipeEntry("item", "iron_ingot", 2),
		},
		field.USE_BRIGHTNESS_FIX,
		field.USE_BLOCKSTATES,
	).WithBlockstates(
		"@self", field.NewBlockState("default"),
		field.NewBlockState("single_left", "~~1000"),
		field.NewBlockState("single_middle", "~~1100"),
		field.NewBlockState("single_right", "~~0100"),
		field.NewBlockState("top_single", "~~0001"),
		field.NewBlockState("top_left", "~~1001"),
		field.NewBlockState("top_middle", "~~1101"),
		field.NewBlockState("top_right", "~~0101"),
		field.NewBlockState("middle_single", "~~0011"),
		field.NewBlockState("middle_left", "~~1011"),
		field.NewBlockState("middle_middle", "~~1111"),
		field.NewBlockState("middle_right", "~~0111"),
		field.NewBlockState("bottom_single", "~~0010"),
		field.NewBlockState("bottom_left", "~~1010"),
		field.NewBlockState("bottom_middle", "~~1110"),
		field.NewBlockState("bottom_right", "~~0110"),
	),
	unit.NewItem(
		"megaphone",
		field.ITEM_INTERACTIVE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "iron_ingot", 1),
		},
		nbt.Tree(),
	),
	unit.NewVariant(
		unit.NewBlock(
			"cup",
			field.BASE_VOID,
			field.SOUND_WOOL,
			field.FACING_PLAYER_PRECISE,
			[]field.RecipeEntry{
				field.NewRecipeEntry("item", "[color]", 3),
			},
		),
		field.DYE_MATERIAL,
	),
	unit.NewBlock(
		"clipboard",
		field.BASE_VOID,
		field.SOUND_WOOL,
		field.FACING_PLAYER_PRECISE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "paper", 1),
		},
	),
	unit.NewBlock(
		"plate",
		field.BASE_VOID,
		field.SOUND_WOOL,
		field.FACING_PLAYER_PRECISE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "quartz_block", 1),
		},
		field.USE_PLACE,
	),
	unit.NewBlock(
		"speakers",
		field.BASE_SOLID,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "black_wool", 1),
		},
		field.USE_BRIGHTNESS_FIX,
	),
	unit.NewBlock(
		"alarm_clock",
		field.BASE_VOID,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER_PRECISE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "bell", 1),
		},
	),
	unit.NewItem(
		"umbrella",
		field.ITEM_INTERACTIVE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "leather", 4),
		},
		nbt.Tree(),
	),
	unit.NewBlock(
		"bear_trap",
		field.BASE_TRIPWIRE,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "iron_ingot", 2),
		},
		field.USE_TICK,
		field.USE_TIMER,
	).WithBlockstates(
		"<manual>", field.NewBlockState("default"),
		field.NewBlockState("closed"),
	),
	unit.NewVariant(
		unit.NewItem(
			"playing_card",
			field.ITEM_NORMAL,
			[]field.RecipeEntry{
				field.NewRecipeEntry("item", "paper", 1),
			},
			nbt.Tree(),
		),
		field.CARD_DECK_MATERIAL(),
	),
}

var Technology = []unit.Unit{
	unit.NewVariant(
		unit.NewBlock(
			"ladder",
			field.BASE_VOID,
			field.SOUND_INDUSTRIAL,
			field.FACING_WALL_NORMAL,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "ladder", 1),
				field.NewRecipeEntry("block", "[base]", 4),
			},
			field.USE_PLACE,
			field.USE_BLOCKSTATES,
			field.USE_NO_BASE,
			field.USE_CUSTOM_BASE,
		).WithBlockstates(
			"@self", field.NewBlockState("default"),
			field.NewBlockState("top", "~~~~0~"),
		),
		field.SOLID_MATERIAL,
	),
	unit.NewVariant(
		unit.NewBlock(
			"padlock_block",
			field.BASE_NONE,
			field.SOUND_INDUSTRIAL,
			field.FACING_DOOR,
			[]field.RecipeEntry{},
			field.USE_PLACE,
			field.USE_NO_BASE,
			field.USE_CUSTOM_BASE,
		).WithBlockstates(
			"@self", field.NewBlockState("left"),
			field.NewBlockState("right"),
		),
		field.WOOL_MATERIAL,
	),
	unit.NewVariant(
		unit.NewBlock(
			"rising_door",
			field.BASE_NONE,
			field.SOUND_WOOD,
			field.FACING_PLAYER,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 4),
			},
			field.USE_PLACE,
			field.USE_BLOCKSTATES,
			field.USE_NO_BASE,
			field.USE_TIMER,
		).WithBlockstates(
			"@self", field.NewBlockState("default"),
			field.NewBlockState("bottom", "~~~~1~"),
		),
		field.SOLID_MATERIAL,
	),
	unit.NewBlock(
		"pipe",
		field.BASE_VOID,
		field.SOUND_INDUSTRIAL,
		field.FACING_NONE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "copper_block", 1),
		},
		field.USE_BLOCKSTATES,
		field.USE_BLOCKSTATE_HOOK,
	).WithBlockstates(
		"@self", field.NewBlockState("default"),
		field.NewBlockState("straight", "110000:0", "001100:90", "010000:0", "000100:90", "100000:0", "001000:90"),
		field.NewBlockState("angle_left", "101000:0", "100100:-90", "011000:90", "010100:180"),
		field.NewBlockState("angle_up", "001010:90", "000110:-90", "100010:0", "010010:180"),
		field.NewBlockState("angle_down", "001001:90", "000101:-90", "100001:0", "010001:180"),
		field.NewBlockState("corner_up", "101010:0", "100110:-90", "011010:90", "010110:180"),
		field.NewBlockState("corner_down", "101001:0", "100101:-90", "011001:90", "010101:180"),
		field.NewBlockState("side_left", "111011:0", "011111:90", "110111:180", "101111:-90"),
		field.NewBlockState("side_up", "111110:0"),
		field.NewBlockState("side_down", "111101:0"),
		field.NewBlockState("junction_left", "100011:0", "010011:180", "001011:90", "000111:-90"),
		field.NewBlockState("junction_up", "110010:0", "001110:90"),
		field.NewBlockState("junction_down", "110001:0", "001101:90"),
		field.NewBlockState("edge_left", "101011:0", "100111:-90", "011011:90", "010111:180"),
		field.NewBlockState("edge_up", "111010:0", "110110:180", "101110:-90", "011110:90"),
		field.NewBlockState("edge_down", "111001:0", "110101:180", "101101:-90", "011101:90"),
		field.NewBlockState("partial_horizontal", "111100:0"),
		field.NewBlockState("partial_vertical", "110011:0", "001111:90"),
		field.NewBlockState("partial_left", "111000:0", "110100:180", "101100:-90", "011100:90"),
		field.NewBlockState("cross", "111111:0"),
	),
	unit.NewBlock(
		"radiator",
		field.BASE_CONTAINER,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "iron_block", 1),
			field.NewRecipeEntry("block", "copper_block", 1),
		},
		field.USE_GUI,
		field.USE_BRIGHTNESS_FIX,
		field.USE_TIMER,
	).WithBlockstates(
		"<manual>", field.NewBlockState("off"),
		field.NewBlockState("on"),
	),
	unit.NewBlock(
		"surveillance_camera",
		field.BASE_NONE,
		field.SOUND_INDUSTRIAL,
		field.FACING_WALL_NORMAL,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "iron_ingot", 1),
			field.NewRecipeEntry("item", "ender_eye", 1),
		},
		field.USE_PLACE,
		field.USE_TICK,
		field.USE_NO_BASE,
		field.USE_TIMER,
	).WithBlockstates(
		"@self", field.NewBlockState("default"),
		field.NewBlockState("stand"),
		field.NewBlockState("camera"),
	),
	unit.NewBlock(
		"security_monitor",
		field.BASE_NONE,
		field.SOUND_INDUSTRIAL,
		field.FACING_WALL_NORMAL,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "iron_ingot", 2),
			field.NewRecipeEntry("block", "tinted_glass", 1),
		},
		field.USE_PLACE,
		field.USE_NO_BASE,
		field.USE_CUSTOM_BASE,
	).WithBlockstates(
		"<manual>", field.NewBlockState("default"),
		field.NewBlockState("off"),
		field.NewBlockState("disabled"),
	),
	unit.NewItem(
		"padlock",
		field.ITEM_INTERACTIVE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "iron_ingot", 4),
		},
		nbt.Tree(),
	),
	unit.NewVariant(
		unit.NewItem(
			"key",
			field.ITEM_INTERACTIVE,
			[]field.RecipeEntry{
				field.NewRecipeEntry("item", "iron_ingot", 1),
				field.NewRecipeEntry("item", "[color]", 1),
			},
			nbt.Tree(),
		),
		field.DYE_MATERIAL,
	),
	unit.NewBlock(
		"keypad_lock",
		field.BASE_SOLID,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "iron_block", 1),
		},
		field.USE_PLACE,
		field.USE_BRIGHTNESS_FIX,
		field.USE_TIMER,
	),
	unit.NewBlock(
		"retina_scanner",
		field.BASE_CONTAINER,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "iron_block", 1),
			field.NewRecipeEntry("item", "spyglass", 1),
		},
		field.USE_GUI,
		field.USE_BRIGHTNESS_FIX,
		field.USE_TIMER,
	).WithBlockstates(
		"<manual>", field.NewBlockState("default"),
		field.NewBlockState("scan"),
		field.NewBlockState("open"),
		field.NewBlockState("error"),
	),
	unit.NewBlock(
		"item_scanner",
		field.BASE_CONTAINER,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "iron_block", 1),
			field.NewRecipeEntry("block", "hopper", 1),
		},
		field.USE_GUI,
		field.USE_BRIGHTNESS_FIX,
		field.USE_TIMER,
	).WithBlockstates(
		"<manual>", field.NewBlockState("default"),
		field.NewBlockState("scan"),
		field.NewBlockState("open"),
		field.NewBlockState("error"),
	),
	unit.NewBlock(
		"computer",
		field.BASE_VOID,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "iron_block", 1),
			field.NewRecipeEntry("item", "redstone", 1),
		},
		field.USE_NO_BASE,
		field.USE_TIMER,
	).WithBlockstates(
		"<manual>", field.NewBlockState("default"),
		field.NewBlockState("boot"),
		field.NewBlockState("login"),
	),
	unit.NewBlock(
		"calculator",
		field.BASE_VOID,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER_PRECISE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "iron_ingot", 1),
			field.NewRecipeEntry("item", "redstone", 1),
		},
	),
	unit.NewBlock(
		"alarm_block",
		field.BASE_REDSTONE,
		field.SOUND_INDUSTRIAL,
		field.FACING_NONE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "bell", 1),
			field.NewRecipeEntry("item", "redstone", 1),
		},
		field.USE_TICK,
		field.USE_BRIGHTNESS_FIX,
		field.USE_TIMER,
	),
	unit.NewBlock(
		"laser_block",
		field.BASE_SOLID,
		field.SOUND_INDUSTRIAL,
		field.FACING_NORMAL,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "glass", 1),
			field.NewRecipeEntry("item", "redstone", 1),
		},
		field.USE_TICK,
		field.USE_BRIGHTNESS_FIX,
		field.USE_TIMER,
	),
	unit.NewItem(
		"nanoglasses",
		field.ITEM_INTERACTIVE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "iron_ingot", 4),
			field.NewRecipeEntry("item", "redstone", 1),
		},
		nbt.Tree(),
	),
	unit.NewItem(
		"crowbar",
		field.ITEM_PICKAXE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "iron_ingot", 2),
		},
		nbt.Tree(),
	),
	unit.NewItem(
		"flashlight",
		field.ITEM_INTERACTIVE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "lantern", 1),
			field.NewRecipeEntry("item", "redstone", 1),
		},
		nbt.Tree(),
	),
	unit.NewItem(
		"battery",
		field.ITEM_NORMAL,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "redstone", 1),
		},
		nbt.Tree(),
	),
	unit.NewBlock(
		"motion_sensor",
		field.BASE_VOID,
		field.SOUND_INDUSTRIAL,
		field.FACING_NONE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "glass", 1),
			field.NewRecipeEntry("item", "redstone", 1),
		},
		field.USE_TICK,
		field.USE_TIMER,
		field.USE_PLACE,
	).WithBlockstates(
		"<manual>", field.NewBlockState("default"),
		field.NewBlockState("triggered"),
	),
	unit.NewBlock(
		"electrical_box",
		field.BASE_VOID,
		field.SOUND_INDUSTRIAL,
		field.FACING_WALL_NORMAL,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "iron_ingot", 2),
			field.NewRecipeEntry("item", "redstone", 1),
		},
		field.USE_NO_BASE,
		field.USE_CUSTOM_BASE,
		field.USE_PLACE,
	).WithBlockstates(
		"<manual>", field.NewBlockState("default"),
		field.NewBlockState("disabled"),
	),
	unit.NewBlock(
		"safe_block",
		field.BASE_REDSTONE,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "iron_ingot", 2),
			field.NewRecipeEntry("item", "redstone", 1),
		},
		field.USE_TICK,
		field.USE_BRIGHTNESS_FIX,
		field.USE_TIMER,
	).WithBlockstates(
		"<manual>", field.NewBlockState("default"),
		field.NewBlockState("open"),
	),
	unit.NewBlock(
		"telescope",
		field.BASE_VOID,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER_PRECISE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "spyglass", 1),
		},
		field.USE_PLACE,
		field.USE_NO_BASE,
		field.USE_CUSTOM_BASE,
	).WithBlockstates(
		"<manual>", field.NewBlockState("default"),
		field.NewBlockState("stand"),
		field.NewBlockState("optics"),
	),
}
