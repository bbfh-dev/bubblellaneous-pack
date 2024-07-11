package unit

import (
	"github.com/bbfh-dev/bubblellaneous-pack/lib"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/nbt"
)

type Unit interface {
	Id() string
	Type() string
	Base() string
	CustomData() nbt.Entry
	MinecraftData() nbt.Entry
	ModelCount() int
	Compile(*lib.Tree)
}
