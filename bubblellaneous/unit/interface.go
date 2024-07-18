package unit

import (
	"github.com/bbfh-dev/bubblellaneous-pack/lib"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/code"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/field"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/nbt"
	"github.com/samber/lo"
)

type Unit interface {
	Id() string
	UnitId() string // Original ID without the material
	Material() *field.Material
	SetVariant(id string, material field.Material) Unit
	Type() string
	Compile(*lib.Tree, int) (int, bool)
	Recipe() []field.RecipeEntry
	SetRecipe([]field.RecipeEntry) Unit
}

func Compile(unit Unit, template code.Template, tree *lib.Tree, customModelData int) int {
	entries, overwritten := unit.Compile(tree, customModelData)

	template.
		Replace("name", unit.Id()).
		Replace("type", unit.Type()).
		Replace("recipe", nbt.ListNBT[nbt.TreeNBT](lo.Map(unit.Recipe(), func(item field.RecipeEntry, _ int) nbt.TreeNBT {
			return nbt.Tree().
				Set("id", nbt.StringNBT(item.Id)).
				Set("group", nbt.StringNBT(item.Group)).
				Set("count", nbt.IntNBT(item.Amount)).
				Set("lore", nbt.StringNBT("[]"))
		})).String()).
		Format().Write(tree)

	if overwritten {
		return entries
	}

	if unit.Material() != nil {
		tree.MkModel().
			From(false, tree.ResourceDir, "bubblellaneous", "models", unit.Type(), unit.UnitId()).
			To("bubblellaneous", "models", unit.Type(), unit.UnitId(), unit.Material().Name).
			Save()
	}

	return 1
}
