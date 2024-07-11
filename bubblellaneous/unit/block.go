package unit

import (
	"github.com/bbfh-dev/bubblellaneous-pack/lib"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/field"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/nbt"
)

type Block struct {
	id     string
	base   string
	sound  string
	facing string
	recipe []field.RecipeEntry
	uses   []string
	states field.States
}

func NewBlock(
	id string,
	base string,
	sound string,
	facing string,
	recipe []field.RecipeEntry,
	uses ...string,
) *Block {
	return &Block{
		id:     id,
		base:   base,
		sound:  sound,
		facing: facing,
		recipe: recipe,
		uses:   uses,
	}
}

func (unit *Block) Id() string {
	return unit.id
}

func (unit *Block) Type() string {
	return "block"
}

func (unit *Block) Base() string {
	return unit.base
}

func (unit *Block) CustomData() nbt.Entry {
	return nbt.Tree()
}

func (unit *Block) MinecraftData() nbt.Entry {
	return nbt.Tree()
}

func (unit *Block) ModelCount() int {
	return 1
}

func (unit *Block) Compile(tree *lib.Tree) {
}

func (block *Block) WithBlockstates(match string, states ...field.BlockState) *Block {
	block.states = field.States{
		Match:  match,
		States: states,
	}

	return block
}
