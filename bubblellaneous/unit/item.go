package unit

import (
	"github.com/bbfh-dev/bubblellaneous-pack/lib"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/field"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/nbt"
)

type Item struct {
	id         string
	base       string
	recipe     []field.RecipeEntry
	components nbt.Entry
}

func NewItem(
	id string,
	base string,
	recipe []field.RecipeEntry,
	components nbt.Entry,
) *Item {
	return &Item{
		id:         id,
		base:       base,
		recipe:     recipe,
		components: components,
	}
}

func (unit *Item) Id() string {
	return unit.id
}

func (unit *Item) Type() string {
	return "item"
}

func (unit *Item) Base() string {
	return unit.base
}

func (unit *Item) CustomData() nbt.Entry {
	return nbt.Tree()
}

func (unit *Item) MinecraftData() nbt.Entry {
	return nbt.Tree()
}

func (unit *Item) ModelCount() int {
	return 1
}

func (unit *Item) Compile(tree *lib.Tree) {
}
