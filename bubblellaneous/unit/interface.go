package unit

import (
	"fmt"
	"strings"

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
	MinecraftBase() string
	SetVariant(id string, material field.Material, count int, index int) Unit
	Type() string
	Compile(*lib.Tree, int) (int, bool)
	Recipe() []field.RecipeEntry
	SetRecipe([]field.RecipeEntry) Unit
	NBT(int) nbt.TreeNBT
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

	loot_table := field.LOOT_TABLE
	loot_table = strings.Replace(loot_table, "[base_item]", unit.MinecraftBase(), 1)
	loot_table = strings.Replace(
		loot_table,
		"[components]",
		nbt.Tree().
			Set("minecraft:custom_model_data", nbt.IntNBT(customModelData)).
			Set("minecraft:item_name", nbt.StringNBT(fmt.Sprintf(`{"translate":"%s.bubblellaneous.%s"}`, unit.Type(), unit.Id()))).
			Extend(unit.NBT(customModelData)).
			String(),
		1,
	)
	tree.MkLootTable(
		fmt.Sprintf("bubblellaneous:%s/%s", unit.Type(), unit.Id()),
		loot_table,
	)

	if overwritten {
		return entries
	}

	if unit.Material() != nil {
		tree.MkModel(
			customModelData,
			unit.MinecraftBase(),
			func(body string) string {
				body = strings.ReplaceAll(body, "[material]", unit.Material().Primary)
				body = strings.ReplaceAll(body, "[primary]", unit.Material().Primary)
				body = strings.ReplaceAll(body, "[secondary]", unit.Material().Secondary)
				return body
			},
			fmt.Sprintf(
				"%s/bubblellaneous/models/%s/%s",
				tree.ResourceDir,
				unit.Type(),
				unit.UnitId(),
			),
			fmt.Sprintf(
				"bubblellaneous/models/%s/%s/%s",
				unit.Type(),
				unit.UnitId(),
				unit.Material().Name,
			),
		)
	} else {
		tree.AddModel(unit.MinecraftBase(), customModelData,
			fmt.Sprintf(
				"bubblellaneous/models/%s/%s",
				unit.Type(),
				unit.UnitId(),
			),
		)
	}

	return 1
}
