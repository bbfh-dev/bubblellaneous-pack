package field

import "github.com/bbfh-dev/bubblellaneous-pack/lib/nbt"

type Food struct {
	Nutrition    int
	Saturation   int
	CanAlwaysEat bool
	EatSeconds   float64
}

func (food *Food) NBT() nbt.TreeNBT {
	return nbt.Tree().
		Set("nutrition", nbt.IntNBT(food.Nutrition)).
		Set("saturation", nbt.IntNBT(food.Saturation)).
		Set("eat_seconds", nbt.JSONFloatNBT(food.EatSeconds)).
		Set("can_always_eat", nbt.BooleanNBT(food.CanAlwaysEat))
}
