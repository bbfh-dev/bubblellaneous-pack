package unit

import (
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
	}
}

func (unit Item) Id() string {
	return unit.id
}

func (unit Item) UnitId() string {
	return unit.unit_id
}

func (unit Item) Material() *field.Material {
	return unit.material
}

func (unit Item) MinecraftBase() string {
	return unit.base
}

func (unit Item) SetVariant(id string, material field.Material, count int, index int) Unit {
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
	return nbt.Tree().Set("minecraft:custom_data", nbt.Tree().Set(
		"bubblellaneous",
		nbt.Tree().Set("item_properties", nbt.Tree()).Set(
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
}
