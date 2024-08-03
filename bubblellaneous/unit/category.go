package unit

import "sort"

type Category struct {
	units []Unit
}

func NewCategory() *Category {
	return &Category{
		units: []Unit{},
	}
}

func (category *Category) Add(unit ...Unit) *Category {
	category.units = append(category.units, unit...)
	return category
}

func (category *Category) Units(name string) (units []Unit) {
	for _, unit := range category.units {
		units = append(units, unit.SetCategory(name))
	}
	return units
}

func (category *Category) RawUnits() []Unit {
	return category.units
}

func (category *Category) Sort() {
	sort.Slice(category.units, func(i, j int) bool {
		return category.units[i].Id() < category.units[j].Id()
	})
}
