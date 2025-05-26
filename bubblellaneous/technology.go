package bubblellaneous

import (
	"github.com/bbfh-dev/bubblellaneous-pack/bubblellaneous/unit"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/field"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/nbt"
)

var Technology = unit.NewCategory().
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
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
		)
	}, field.SOLID_MATERIAL).Units()...).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
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
		).Hide()
	}, field.WOOL_MATERIAL).Units()...).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
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
		)
	}, field.SOLID_MATERIAL).Units()...).
	Add(unit.NewBlock(
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
	).
	Add(unit.NewBlock(
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
	)).
	Add(unit.NewBlock(
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
	)).
	Add(unit.NewBlock(
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
	)).
	Add(unit.NewItem(
		"padlock",
		field.ITEM_INTERACTIVE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "iron_ingot", 4),
		},
		nbt.Tree(),
	)).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewItem(
			"key",
			field.ITEM_INTERACTIVE,
			[]field.RecipeEntry{
				field.NewRecipeEntry("item", "iron_ingot", 1),
				field.NewRecipeEntry("item", "[color]", 1),
			},
			nbt.Tree(),
		)
	}, field.DYE_MATERIAL).Units()...).
	Add(unit.NewBlock(
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
	)).
	Add(unit.NewBlock(
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
	)).
	Add(unit.NewBlock(
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
	)).
	Add(unit.NewBlock(
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
	)).
	Add(unit.NewBlock(
		"calculator",
		field.BASE_VOID,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER_PRECISE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "iron_ingot", 1),
			field.NewRecipeEntry("item", "redstone", 1),
		},
	)).
	Add(unit.NewBlock(
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
	)).
	Add(unit.NewBlock(
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
	)).
	Add(unit.NewItem(
		"nanoglasses",
		field.ITEM_INTERACTIVE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "iron_ingot", 4),
			field.NewRecipeEntry("item", "redstone", 1),
		},
		nbt.Tree(),
	)).
	Add(unit.NewItem(
		"crowbar",
		field.ITEM_NORMAL,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "iron_ingot", 2),
		},
		nbt.Tree(),
	)).
	Add(unit.NewItem(
		"flashlight",
		field.ITEM_INTERACTIVE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "lantern", 1),
			field.NewRecipeEntry("item", "redstone", 1),
		},
		nbt.Tree(),
	).WithData(nbt.Tree().
		Set("battery", nbt.IntNBT(12000)).
		Set("max_charge", nbt.IntNBT(12000)).
		Set("is_turned_on", nbt.IntNBT(0))).WithCallback(func(tree nbt.TreeNBT) nbt.TreeNBT {
		return tree.Set(
			"minecraft:attribute_modifiers",
			nbt.ListNBT[nbt.TreeNBT]{
				nbt.Tree().
					Set("id", nbt.StringNBT("flashlight")).
					Set("type", nbt.StringNBT("minecraft:attack_speed")).
					Set("amount", nbt.IntNBT(-1)).
					Set("operation", nbt.StringNBT("add_multiplied_total")).
					Set("slot", nbt.StringNBT("mainhand")),
			},
		)
	})).
	Add(unit.NewItem(
		"battery",
		field.ITEM_NORMAL,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "redstone", 1),
		},
		nbt.Tree(),
	)).
	Add(unit.NewBlock(
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
	)).
	Add(unit.NewBlock(
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
	)).
	Add(unit.NewBlock(
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
	)).
	Add(unit.NewBlock(
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
	))
