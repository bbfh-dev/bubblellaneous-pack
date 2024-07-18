package unit

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

func (category *Category) Units() []Unit {
	return category.units
}
