package unit

import (
	"github.com/bbfh-dev/bubblellaneous-pack/lib"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/field"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/nbt"
)

type Variant[T Unit] struct {
	unit      T
	materials []field.Material
}

func NewVariant[T Unit](unit T, materials []field.Material) *Variant[T] {
	return &Variant[T]{
		unit:      unit,
		materials: materials,
	}
}

func (variant *Variant[T]) Id() string {
	return variant.unit.Id()
}

func (variant *Variant[T]) Type() string {
	return variant.unit.Type()
}

func (variant *Variant[T]) Base() string {
	return variant.unit.Base()
}

func (variant *Variant[T]) CustomData() nbt.Entry {
	return variant.unit.CustomData()
}

func (variant *Variant[T]) MinecraftData() nbt.Entry {
	return variant.unit.MinecraftData()
}

func (variant *Variant[T]) ModelCount() int {
	return variant.unit.ModelCount()
}

func (variant *Variant[T]) Compile(tree *lib.Tree) {
	variant.unit.Compile(tree)
}
