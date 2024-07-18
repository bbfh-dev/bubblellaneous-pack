package unit

import (
	"github.com/bbfh-dev/bubblellaneous-pack/lib"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/field"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/nbt"
)

type Item struct {
	unit_id    string
	id         string
	material   *field.Material
	base       string
	recipe     []field.RecipeEntry
	components nbt.Entry
}

func NewItem(
	id string,
	base string,
	recipe []field.RecipeEntry,
	components nbt.Entry,
) Item {
	return Item{
		unit_id:    id,
		id:         id,
		material:   nil,
		base:       base,
		recipe:     recipe,
		components: components,
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

func (unit Item) SetVariant(id string, material field.Material) Unit {
	unit.material = &material
	unit.id = id
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
