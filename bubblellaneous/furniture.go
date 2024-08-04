package bubblellaneous

import (
	"github.com/bbfh-dev/bubblellaneous-pack/bubblellaneous/unit"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/field"
)

var Furniture = unit.NewCategory().
	Add(unit.NewBlock(
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
	)).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
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
		)
	}, field.SOLID_MATERIAL).Units()...).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
			"shelf",
			field.BASE_VOID,
			field.SOUND_WOOD,
			field.FACING_WALL_NORMAL,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
			field.USE_PLACE,
		).WithBlockType(field.ShelfBlock(1, 0))
	}, field.SOLID_MATERIAL).Units()...).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
			"cabinet",
			field.BASE_CONTAINER,
			field.SOUND_WOOD,
			field.FACING_PLAYER,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
			field.USE_BRIGHTNESS_FIX,
		)
	}, field.SOLID_MATERIAL).Units()...).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
			"drawer",
			field.BASE_UPPER,
			field.SOUND_WOOD,
			field.FACING_PLAYER,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
		)
	}, field.SOLID_MATERIAL).Units()...).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
			"cupboard",
			field.BASE_SOLID,
			field.SOUND_WOOD,
			field.FACING_PLAYER,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
			field.USE_PLACE,
			field.USE_BRIGHTNESS_FIX,
		).WithBlockType(field.ShelfBlock(2, 0))
	}, field.SOLID_MATERIAL).Units()...).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
			"bench",
			field.BASE_TRIPWIRE,
			field.SOUND_WOOD,
			field.FACING_PLAYER,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
			field.USE_PLACE,
		).WithBlockType(field.SeatBlock(0.8, 0.6))
	}, field.SOLID_MATERIAL).Units()...).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
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
		).WithBlockType(field.SeatBlock(0.8, 0.5))
	}, field.WOOL_MATERIAL).Units()...).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
			"stool",
			field.BASE_VOID,
			field.SOUND_WOOD,
			field.FACING_NONE,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
			field.USE_PLACE,
		).WithBlockType(field.SeatBlock(0.8, 0.6))
	}, field.WOOD_MATERIAL).Units()...).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
			"barstool",
			field.BASE_VOID,
			field.SOUND_WOOD,
			field.FACING_NONE,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
			field.USE_PLACE,
		).WithBlockType(field.SeatBlock(0.8, 0.7))
	}, field.WOOD_MATERIAL).Units()...).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
			"dinning_chair",
			field.BASE_VOID,
			field.SOUND_WOOD,
			field.FACING_PLAYER,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
				field.NewRecipeEntry("block", "[color]", 2),
			},
			field.USE_PLACE,
		).WithBlockType(field.SeatBlock(0.8, 0.46))
	}, field.WOOD_WITH_WOOL_MATERIAL()).Units()...).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
			"blinds",
			field.BASE_VOID,
			field.SOUND_WOOD,
			field.FACING_WALL_NORMAL,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
		)
	}, field.SOLID_MATERIAL).Units()...).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
			"kitchen_cabinet",
			field.BASE_CONTAINER,
			field.SOUND_WOOD,
			field.FACING_PLAYER,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
			field.USE_BRIGHTNESS_FIX,
		)
	}, field.SOLID_MATERIAL).Units()...).
	Add(unit.NewBlock(
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
	)).
	Add(unit.NewBlock(
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
	)).
	Add(unit.NewBlock(
		"trashcan",
		field.BASE_DRIPSTONE,
		field.SOUND_WOOD,
		field.FACING_NONE,
		[]field.RecipeEntry{
			field.NewRecipeEntry("block", "iron_block", 4),
		},
		field.USE_PLACE,
		field.USE_BRIGHTNESS_FIX,
	)).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
			"table_lamp",
			field.BASE_NONE,
			field.SOUND_WOOD,
			field.FACING_NONE,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[color]", 4),
			},
			field.USE_PLACE,
			field.USE_NO_BASE,
		).WithBlockType(field.LightBlock(15))
	}, field.WOOL_MATERIAL).Units()...).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
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
			"!#no_solid_collision",
			field.NewBlockState("default"),
			field.NewBlockState("wall", "~1~~~~"),
		).WithBlockType(field.LightBlock(15))
	}, field.SOLID_MATERIAL).Units()...).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
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
		).WithBlockType(field.LightBlock(15))
	}, field.WOOL_MATERIAL).Units()...).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
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
		).WithBlockType(field.SeatBlock(0.9, 0.5))
	}, field.WOOD_WITH_WOOL_MATERIAL()).Units()...).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
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
		).WithBlockType(field.LightBlock(15))
	}, field.WOOL_MATERIAL).Units()...).
	Add(unit.NewBlock(
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
	)).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
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
		)
	}, field.SOLID_MATERIAL).Units()...).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewBlock(
			"toilet",
			field.BASE_TRIPWIRE,
			field.SOUND_WOOD,
			field.FACING_PLAYER,
			[]field.RecipeEntry{
				field.NewRecipeEntry("block", "[base]", 1),
			},
			field.USE_PLACE,
		).WithBlockType(field.SeatBlock(0.6, 0.51))
	}, field.SOLID_MATERIAL).Units()...)
