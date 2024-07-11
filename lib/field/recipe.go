package field

type RecipeEntry struct {
	Group  string
	Id     string
	Amount uint8
}

func NewRecipeEntry(group string, id string, amount uint8) RecipeEntry {
	return RecipeEntry{
		Group:  group,
		Id:     id,
		Amount: amount,
	}
}
