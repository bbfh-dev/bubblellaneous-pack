package bubblellaneous

import (
	"github.com/bbfh-dev/bubblellaneous-pack/bubblellaneous/unit"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/field"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/nbt"
)

var Food = unit.NewCategory().
	Add(unit.NewItem(
		"coffee_cup",
		field.ITEM_DRINK,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "cocoa_beans", 2),
		},
		nbt.Tree(),
	)).
	Add(unit.NewItem(
		"cucumber",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "wheat_seeds", 1),
		},
		nbt.Tree(),
	)).
	Add(unit.NewItem(
		"grapes",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "wheat_seeds", 1),
		},
		nbt.Tree(),
	)).
	Add(unit.NewItem(
		"burger",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "bread", 1),
			field.NewRecipeEntry("item", "cooked_beef", 1),
		},
		nbt.Tree(),
	)).
	Add(unit.NewItem(
		"toast",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "bread", 1),
		},
		nbt.Tree(),
	)).
	Add(unit.NewItem(
		"tomato",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "wheat_seeds", 1),
		},
		nbt.Tree(),
	)).
	Add(unit.NewItem(
		"cheese",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "milk_bucket", 1),
		},
		nbt.Tree(),
	)).
	Add(unit.NewItem(
		"chocolate_bar",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "cocoa_beans", 1),
		},
		nbt.Tree(),
	)).
	Add(unit.NewItem(
		"donut",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "bread", 1),
			field.NewRecipeEntry("item", "sugar", 1),
		},
		nbt.Tree(),
	)).
	Add(unit.NewItem(
		"broccoli",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "wheat_seeds", 1),
		},
		nbt.Tree(),
	)).
	Add(unit.NewItem(
		"omelette",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "egg", 1),
		},
		nbt.Tree(),
	)).
	Add(unit.NewItem(
		"strawberry",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "wheat_seeds", 1),
		},
		nbt.Tree(),
	)).
	Add(unit.NewItem(
		"cereal",
		field.ITEM_FOOD,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "wheat", 2),
		},
		nbt.Tree(),
	)).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewItem(
			"beer_bottle",
			field.ITEM_DRINK,
			[]field.RecipeEntry{
				field.NewRecipeEntry("item", "glass_bottle", 1),
				field.NewRecipeEntry("item", "[color]", 1),
			},
			nbt.Tree(),
		)
	}, field.DYE_MATERIAL).Units()...)
