package bubblellaneous

import (
	"github.com/bbfh-dev/bubblellaneous-pack/bubblellaneous/unit"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/field"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/nbt"
)

var Food = unit.NewCategory().
	Add(unit.NewItem(
		"coffee_cup",
		field.ITEM_NORMAL,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "cocoa_beans", 2),
		},
		nbt.Tree(),
	).WithFood(3, 1, true, 2.0)).
	Add(unit.NewItem(
		"cucumber",
		field.ITEM_NORMAL,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "wheat_seeds", 1),
		},
		nbt.Tree(),
	).WithFood(2, 1, false, 1.0)).
	Add(unit.NewItem(
		"grapes",
		field.ITEM_NORMAL,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "wheat_seeds", 1),
		},
		nbt.Tree(),
	).WithFood(1, 1, false, 1.0)).
	Add(unit.NewItem(
		"burger",
		field.ITEM_NORMAL,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "bread", 1),
			field.NewRecipeEntry("item", "cooked_beef", 1),
		},
		nbt.Tree(),
	).WithFood(8, 6, false, 5.0)).
	Add(unit.NewItem(
		"toast",
		field.ITEM_NORMAL,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "bread", 1),
		},
		nbt.Tree(),
	).WithFood(2, 5, false, 2.0)).
	Add(unit.NewItem(
		"tomato",
		field.ITEM_NORMAL,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "wheat_seeds", 1),
		},
		nbt.Tree(),
	).WithFood(1, 1, false, 1.0)).
	Add(unit.NewItem(
		"cheese",
		field.ITEM_NORMAL,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "milk_bucket", 1),
		},
		nbt.Tree(),
	).WithFood(1, 5, false, 1.0)).
	Add(unit.NewItem(
		"chocolate_bar",
		field.ITEM_NORMAL,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "cocoa_beans", 1),
		},
		nbt.Tree(),
	).WithFood(3, 1, false, 1.5)).
	Add(unit.NewItem(
		"donut",
		field.ITEM_NORMAL,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "bread", 1),
			field.NewRecipeEntry("item", "sugar", 1),
		},
		nbt.Tree(),
	).WithFood(8, 5, false, 4.0)).
	Add(unit.NewItem(
		"broccoli",
		field.ITEM_NORMAL,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "wheat_seeds", 1),
		},
		nbt.Tree(),
	).WithFood(3, 3, false, 1.0)).
	Add(unit.NewItem(
		"omelette",
		field.ITEM_NORMAL,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "egg", 1),
		},
		nbt.Tree(),
	).WithFood(2, 4, false, 1.5)).
	Add(unit.NewItem(
		"strawberry",
		field.ITEM_NORMAL,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "wheat_seeds", 1),
		},
		nbt.Tree(),
	).WithFood(1, 1, false, 0.5)).
	Add(unit.NewItem(
		"cereal",
		field.ITEM_NORMAL,
		[]field.RecipeEntry{
			field.NewRecipeEntry("item", "wheat", 2),
		},
		nbt.Tree(),
	).WithFood(10, 14, false, 6.0)).
	Add(unit.NewVariant(func() unit.Unit {
		return unit.NewItem(
			"beer_bottle",
			field.ITEM_NORMAL,
			[]field.RecipeEntry{
				field.NewRecipeEntry("item", "glass_bottle", 1),
				field.NewRecipeEntry("item", "[color]", 1),
			},
			nbt.Tree(),
		).WithFood(4, 5, true, 4.0)
	}, field.DYE_MATERIAL).Units()...)
