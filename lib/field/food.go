package field

import "github.com/bbfh-dev/bubblellaneous-pack/lib/nbt"

type Food struct {
	Nutrition    int
	Saturation   int
	CanAlwaysEat bool
	EatSeconds   float64
	Animation    string
}

func (food *Food) NBT() (nbt.TreeNBT, nbt.TreeNBT) {
	consumable := nbt.Tree().
		Set("animation", nbt.StringNBT(food.Animation)).
		Set("consume_seconds", nbt.JSONFloatNBT(food.EatSeconds))
	if food.Animation == "drink" {
		consumable.Set("sound", nbt.StringNBT("minecraft:entity.generic.drink"))
	}
	return consumable,
		nbt.Tree().
			Set("nutrition", nbt.IntNBT(food.Nutrition)).
			Set("saturation", nbt.IntNBT(food.Saturation)).
			Set("can_always_eat", nbt.BooleanNBT(food.CanAlwaysEat))
}
