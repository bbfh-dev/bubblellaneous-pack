package bubblellaneous

import (
	"github.com/bbfh-dev/bubblellaneous-pack/bubblellaneous/unit"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/field"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/nbt"
)

var Miscellaneous = unit.NewCategory().
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
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
		)
	}, field.SOLID_MATERIAL).Units()...).
	Add(unit.NewBlock(
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
	)).
	Add(unit.NewBlock(
		"traffic_barrier",
		field.BASE_UPPER,
		field.SOUND_WOOD,
		field.FACING_PLAYER_PRECISE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "oak_planks", 6),
		},
	)).
	Add(unit.NewBlock(
		"mossy_traffic_barrier",
		field.BASE_UPPER,
		field.SOUND_WOOD,
		field.FACING_PLAYER_PRECISE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "oak_planks", 6),
			field.NewRecipeEntry("block", "moss_carpet", 1),
		},
	)).
	Add(unit.NewBlock(
		"pole",
		field.BASE_CHAIN,
		field.SOUND_INDUSTRIAL,
		field.FACING_NONE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "chain", 1),
		},
	)).
	Add(unit.NewBlock(
		"box",
		field.BASE_CONTAINER,
		field.SOUND_WOOL,
		field.FACING_PLAYER,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "leather", 8),
		},
		field.USE_BRIGHTNESS_FIX,
	)).
	Add(unit.NewBlock(
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
	)).
	Add(unit.NewBlock(
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
	)).
	Add(unit.NewItem(
		"megaphone",
		field.ITEM_INTERACTIVE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "iron_ingot", 1),
		},
		nbt.Tree(),
	)).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
			"cup",
			field.BASE_VOID,
			field.SOUND_WOOL,
			field.FACING_PLAYER_PRECISE,
			[]field.RecipeEntry{
				field.NewRecipeEntry("item", "[color]", 3),
			},
		)
	}, field.DYE_MATERIAL).Units()...).
	Add(unit.NewBlock(
		"clipboard",
		field.BASE_VOID,
		field.SOUND_WOOL,
		field.FACING_PLAYER_PRECISE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "paper", 1),
		},
	)).
	Add(unit.NewBlock(
		"plate",
		field.BASE_VOID,
		field.SOUND_WOOL,
		field.FACING_PLAYER_PRECISE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "quartz_block", 1),
		},
		field.USE_PLACE,
	).WithBlockType(field.ShelfBlock(1, -0.45))).
	Add(unit.NewBlock(
		"speakers",
		field.BASE_SOLID,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "black_wool", 1),
		},
		field.USE_BRIGHTNESS_FIX,
	)).
	Add(unit.NewBlock(
		"alarm_clock",
		field.BASE_VOID,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER_PRECISE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "bell", 1),
		},
	)).
	Add(unit.NewItem(
		"umbrella",
		field.ITEM_INTERACTIVE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "leather", 4),
		},
		nbt.Tree(),
	)).
	Add(unit.NewBlock(
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
	)).
	Add(unit.NewBlock(
		"no_entrance_road_sign",
		field.BASE_CHAIN,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "chain", 1),
			field.NewRecipeEntry("block", "white_banner", 1),
		},
	).WithGroupId("road_sign")).
	Add(unit.NewBlock(
		"arrow_down_road_sign",
		field.BASE_CHAIN,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "chain", 1),
			field.NewRecipeEntry("block", "white_banner", 1),
		},
	).WithGroupId("road_sign")).
	Add(unit.NewBlock(
		"arrow_up_road_sign",
		field.BASE_CHAIN,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "chain", 1),
			field.NewRecipeEntry("block", "white_banner", 1),
		},
	).WithGroupId("road_sign")).
	Add(unit.NewBlock(
		"arrow_left_road_sign",
		field.BASE_CHAIN,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "chain", 1),
			field.NewRecipeEntry("block", "white_banner", 1),
		},
	).WithGroupId("road_sign")).
	Add(unit.NewBlock(
		"arrow_right_road_sign",
		field.BASE_CHAIN,
		field.SOUND_INDUSTRIAL,
		field.FACING_PLAYER,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "chain", 1),
			field.NewRecipeEntry("block", "white_banner", 1),
		},
	).WithGroupId("road_sign")).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewItem(
			"playing_card",
			field.ITEM_NORMAL,
			[]field.RecipeEntry{
				field.NewRecipeEntry("item", "paper", 1),
			},
			nbt.Tree(),
		)
	}, field.CARD_DECK_MATERIAL()).Units()...)
