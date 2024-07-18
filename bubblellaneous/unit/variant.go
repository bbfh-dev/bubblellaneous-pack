package unit

import (
	"fmt"

	"github.com/bbfh-dev/bubblellaneous-pack/lib/field"
)

type Variant[T Unit] struct {
	newUnit   func() T
	materials []field.Material
}

func NewVariant[T Unit](newUnit func() T, materials []field.Material) Variant[T] {
	return Variant[T]{
		newUnit:   newUnit,
		materials: materials,
	}
}

func (variant Variant[T]) Units() (units []Unit) {
	for _, material := range variant.materials {
		unit := variant.newUnit()
		unit = unit.SetVariant(fmt.Sprintf("%s_%s", material.Name, unit.Id()),
			material,
		).(T)

		units = append(units, unit)
	}
	return units
}
