package unit

import (
	"fmt"
	"strings"

	"github.com/bbfh-dev/bubblellaneous-pack/lib"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/code"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/field"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/nbt"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/util"
)

type Block struct {
	unit_id       string
	id            string
	translateId   string
	material      *field.Material
	base          string
	sound         string
	facing        string
	recipe        []field.RecipeEntry
	uses          []string
	states        field.States
	materialCount int
	materialIndex int
	blockType     *field.BlockType
	category      string
	groupOverride string
	hidden        bool
}

func (block Block) WithBlockstates(match string, states ...field.BlockState) Block {
	block.states = field.States{
		Match:  match,
		States: states,
	}

	return block
}

func (block Block) WithGroupOverride(override string) Block {
	block.groupOverride = override

	return block
}

func (block Block) WithBlockType(blockType *field.BlockType) Block {
	block.blockType = blockType

	return block
}

func (block Block) WithGroupId(id string) Block {
	block.unit_id = id

	return block
}

func (block Block) Hide() Block {
	block.hidden = true

	return block
}

func NewBlock(
	id string,
	base string,
	sound string,
	facing string,
	recipe []field.RecipeEntry,
	uses ...string,
) Block {
	return Block{
		unit_id:       id,
		id:            id,
		translateId:   id,
		material:      nil,
		base:          base,
		sound:         sound,
		facing:        facing,
		recipe:        recipe,
		uses:          uses,
		states:        field.States{},
		materialCount: 0,
		materialIndex: 0,
		blockType:     nil,
		category:      "",
		groupOverride: "",
		hidden:        false,
	}
}

func (unit Block) tags() (tags []nbt.StringNBT) {
	for _, use := range unit.uses {
		tags = append(tags, nbt.StringNBT(use))
	}
	return tags
}

func (unit Block) Id() string {
	return unit.id
}

func (unit Block) UnitId() string {
	return unit.unit_id
}

func (unit Block) TranslateId() string {
	return unit.translateId
}

func (unit Block) Material() *field.Material {
	return unit.material
}

func (unit Block) MinecraftBase() string {
	return "minecraft:item_frame"
}

func (unit Block) SetVariant(id string, material field.Material, count int, index int) Unit {
	for i, entry := range unit.recipe {
		for key, texture := range material.Textures {
			entry.Id = strings.ReplaceAll(entry.Id, fmt.Sprintf("[%s]", key), texture)
		}
		unit.recipe[i] = entry
	}

	a := material
	unit.material = &a
	unit.id = id
	unit.translateId = id
	for _, material := range field.SOLIDS {
		if strings.Contains(id, material) {
			for _, color := range field.COLORS {
				if strings.HasPrefix(id, color) {
					unit.translateId = strings.TrimPrefix(id, color+"_")
					break
				}
			}
			break
		}
	}
	unit.materialCount = count
	unit.materialIndex = index
	return unit
}

func (unit Block) Type() string {
	return "block"
}

func (unit Block) Compile(tree *lib.Tree, customModelData int) (int, bool) {
	if len(unit.states.States) > 0 {
		if unit.states.Match != "<manual>" && unit.materialIndex == 0 {
			tree.MkStateRegistry(unit.unit_id, unit.states.States)
			var blockStates []string
			for i, direction := range field.DIRECTIONS {
				predicate := strings.ReplaceAll( // TODO: Move into a function instead
					strings.ReplaceAll(
						strings.ReplaceAll(
							unit.states.Predicate(),
							"[coords]",
							direction.Coordinates,
						),
						"[-coords]",
						direction.Negative,
					),
					"[name]",
					unit.UnitId(),
				)
				blockStates = append(
					blockStates,
					fmt.Sprintf(
						"%s run data modify storage bubblellaneous tmp.in.bit%d set value \"i\"",
						predicate,
						i,
					),
				)
			}
			code.NewTemplate("blockstate_update").
				Replace("name", unit.unit_id).
				Replace("block_states", strings.Join(blockStates, "\n")).
				Format().Write(tree)
		}

		for i, blockState := range unit.states.States {
			if unit.Material() != nil {
				tree.MkModel(
					customModelData+i,
					unit.MinecraftBase(),
					func(body string) string {
						body = strings.ReplaceAll(body, "[material]", unit.Material().Primary)
						body = strings.ReplaceAll(body, "[primary]", unit.Material().Primary)
						body = strings.ReplaceAll(body, "[secondary]", unit.Material().Secondary)
						return body
					},
					fmt.Sprintf(
						"%s/bubblellaneous/models/%s/%s/template/%s",
						tree.ResourceDir,
						unit.Type(),
						unit.UnitId(),
						blockState.Name,
					),
					fmt.Sprintf(
						"bubblellaneous/models/%s/%s/%s/%s",
						unit.Type(),
						unit.UnitId(),
						unit.Material().Name,
						blockState.Name,
					),
				)
			} else {
				tree.MkModel(
					customModelData+i,
					unit.MinecraftBase(),
					func(body string) string {
						return body
					},
					fmt.Sprintf(
						"%s/bubblellaneous/models/%s/%s/template/%s",
						tree.ResourceDir,
						unit.Type(),
						unit.UnitId(),
						blockState.Name,
					),
					fmt.Sprintf(
						"bubblellaneous/models/%s/%s/%s",
						unit.Type(),
						unit.UnitId(),
						blockState.Name,
					),
				)
			}

			if unit.materialIndex != 0 {
				continue
			}

			code.NewTemplate("block_state").
				Replace("block_state", blockState.Name).
				Replace("index", fmt.Sprintf("%d", i)).
				Replace("name", unit.UnitId()).
				Replace("model_id", fmt.Sprintf("%d", i)).
				Format().Write(tree)
		}

		return len(unit.states.States), true
	}

	return 1, false
}

func (unit Block) Recipe() []field.RecipeEntry {
	return unit.recipe
}

func (unit Block) SetRecipe(recipe []field.RecipeEntry) Unit {
	unit.recipe = recipe
	return unit
}

func (unit Block) NBT(customModelData int) nbt.TreeNBT {
	return nbt.Tree().
		Set(
			"minecraft:entity_data",
			nbt.Tree().
				Set("id", nbt.StringNBT("minecraft:item_frame")).
				Set("Invisible", nbt.IntNBT(1)).
				Set("Tags", append(nbt.ListNBT[nbt.StringNBT]{"+bubblellaneous", "local.place"}, unit.tags()...)).
				Set("Fixed", nbt.IntNBT(1)).
				Set("Invulnerable", nbt.IntNBT(1)).
				Set("Silent", nbt.IntNBT(1)).
				Set(
					"Item",
					nbt.Tree().
						Set("id", nbt.StringNBT("minecraft:stone_button")).
						Set("count", nbt.IntNBT(1)).
						Set("components", nbt.Tree().Set("minecraft:custom_data", nbt.Tree().Set(
							"bubblellaneous",
							nbt.Tree().Set("block_properties", nbt.Tree()).Set(
								"block_data",
								nbt.Tree().
									Set("id", nbt.StringNBT(unit.id)).
									Set("custom_model_data", nbt.IntNBT(customModelData)).
									Set("display_name", nbt.StringNBT(fmt.Sprintf(`{"translate":"%s.bubblellaneous.%s"}`, unit.Type(), unit.TranslateId()))).
									Set("material_count", nbt.IntNBT(unit.materialCount)).
									Set("material", nbt.Tree().
										Set("index", nbt.IntNBT(unit.materialIndex)).
										Set("name", nbt.StringNBT(util.GetOrDefault(unit.Material(), field.DEFAULT_MATERIAL).Name)),
									).Set("block_type", util.GetOrDefault(unit.blockType, field.DEFAULT_BLOCK_TYPE).NBT()).
									Set("name", nbt.StringNBT(unit.unit_id)).
									Set("base_item", nbt.StringNBT(unit.MinecraftBase())).
									Set("base", nbt.StringNBT(unit.base)).
									Set("sound", nbt.StringNBT(unit.sound)).
									Set("facing", nbt.StringNBT(unit.facing)).
									Set("unit", nbt.StringNBT(unit.Type())),
							),
						))),
				),
		)
}

func (unit Block) Category() string {
	return unit.category
}

func (unit Block) SetCategory(category string) Unit {
	unit.category = category
	return unit
}

func (unit Block) Group() string {
	if len(unit.groupOverride) > 0 {
		return unit.groupOverride
	}
	return unit.UnitId()
}

func (unit Block) Hidden() bool {
	return unit.hidden
}
