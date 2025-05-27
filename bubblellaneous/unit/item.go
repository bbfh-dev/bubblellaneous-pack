package unit

import (
	"fmt"
	"strings"

	"github.com/bbfh-dev/bubblellaneous-pack/lib"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/field"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/nbt"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/util"
)

type Item struct {
	unit_id       string
	id            string
	material      *field.Material
	base          string
	recipe        []field.RecipeEntry
	components    nbt.Entry
	materialCount int
	materialIndex int
	category      string
	food          *field.Food
	itemData      nbt.TreeNBT
	nbtCallback   func(nbt.TreeNBT) nbt.TreeNBT
}

func (item Item) DefaultBlockstate() string {
	return "default"
}

func (item Item) WithFood(nutrition, saturation int, always bool, time float64, animation string) Item {
	item.food = &field.Food{
		Nutrition:    nutrition,
		Saturation:   saturation,
		CanAlwaysEat: always,
		EatSeconds:   time,
		Animation:    animation,
	}
	return item
}

func (item Item) WithData(tree nbt.TreeNBT) Item {
	item.itemData = tree
	return item
}

func (item Item) WithCallback(callback func(nbt.TreeNBT) nbt.TreeNBT) Item {
	item.nbtCallback = callback
	return item
}

func NewItem(
	id string,
	base string,
	recipe []field.RecipeEntry,
	components nbt.Entry,
) Item {
	return Item{
		unit_id:       id,
		id:            id,
		material:      nil,
		base:          base,
		recipe:        recipe,
		components:    components,
		materialCount: 0,
		materialIndex: 0,
		category:      "",
		food:          nil,
		itemData:      nbt.Tree(),
		nbtCallback: func(tree nbt.TreeNBT) nbt.TreeNBT {
			return tree
		},
	}
}

func (unit Item) Id() string {
	return unit.id
}

func (unit Item) UnitId() string {
	return unit.unit_id
}

func (unit Item) TranslateId() string {
	return unit.id
}

func (unit Item) Material() *field.Material {
	return unit.material
}

func (unit Item) MinecraftBase() string {
	return unit.base
}

func (unit Item) SetVariant(id string, material field.Material, count int, index int) Unit {
	for i, entry := range unit.recipe {
		for key, texture := range material.Textures {
			entry.Id = strings.ReplaceAll(entry.Id, fmt.Sprintf("[%s]", key), texture)
		}
		unit.recipe[i] = entry
	}

	unit.material = &material
	unit.id = id
	unit.materialCount = count
	unit.materialIndex = index
	return unit
}

func (unit Item) Type() string {
	return "item"
}

func (unit Item) Compile(tree *lib.Tree, customModelData int) (int, bool) {
	return 1, false
}

func (unit Item) Recipe() []field.RecipeEntry {
	return unit.recipe
}

func (unit Item) SetRecipe(recipe []field.RecipeEntry) Unit {
	unit.recipe = recipe
	return unit
}

func (unit Item) NBT(customModelData int) nbt.TreeNBT {
	tree := nbt.Tree()
	if unit.food != nil {
		consumable, food := unit.food.NBT()
		tree.Set("minecraft:consumable", consumable)
		tree.Set("minecraft:food", food)
	}
	data := tree.Set("minecraft:custom_data", nbt.Tree().Set(
		"bubblellaneous",
		nbt.Tree().
			Set("item_properties", unit.itemData).
			Set(
				"item_data",
				nbt.Tree().
					Set("id", nbt.StringNBT(unit.Id())).
					Set("unit", nbt.StringNBT("item")).
					Set("name", nbt.StringNBT(unit.unit_id)).
					Set("custom_model_data", nbt.IntNBT(customModelData)).
					Set("material", nbt.Tree().
						Set("index", nbt.IntNBT(unit.materialIndex)).
						Set("name", nbt.StringNBT(util.GetOrDefault(unit.Material(), field.DEFAULT_MATERIAL).Name)),
					),
			),
	))
	return unit.nbtCallback(data)
}

func (unit Item) Category() string {
	return unit.category
}

func (unit Item) SetCategory(category string) Unit {
	unit.category = category
	return unit
}

func (unit Item) Group() string {
	return unit.UnitId()
}

func (unit Item) Hidden() bool {
	return false
}
