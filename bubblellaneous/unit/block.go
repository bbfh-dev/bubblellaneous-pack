package unit

import (
	"fmt"
	"strings"

	"github.com/bbfh-dev/bubblellaneous-pack/lib"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/field"
)

type Block struct {
	unit_id  string
	id       string
	material *field.Material
	base     string
	sound    string
	facing   string
	recipe   []field.RecipeEntry
	uses     []string
	states   field.States
}

func (block Block) WithBlockstates(match string, states ...field.BlockState) Block {
	block.states = field.States{
		Match:  match,
		States: states,
	}

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
		unit_id:  id,
		id:       id,
		material: nil,
		base:     base,
		sound:    sound,
		facing:   facing,
		recipe:   recipe,
		uses:     uses,
		states:   field.States{},
	}
}

func (unit Block) Id() string {
	return unit.id
}

func (unit Block) UnitId() string {
	return unit.unit_id
}

func (unit Block) Material() *field.Material {
	return unit.material
}

func (unit Block) SetVariant(id string, material field.Material) Unit {
	for i, entry := range unit.recipe {
		for key, texture := range material.Textures {
			entry.Id = strings.ReplaceAll(entry.Id, fmt.Sprintf("[%s]", key), texture)
		}
		unit.recipe[i] = entry
	}

	unit.material = &material
	unit.id = id
	return unit
}

func (unit Block) Type() string {
	return "block"
}

func (unit Block) Compile(tree *lib.Tree, customModelData int) (int, bool) {
	if len(unit.states.States) > 0 {
		// TODO: Compile block states
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
