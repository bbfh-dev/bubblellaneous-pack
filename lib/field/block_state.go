package field

type BlockState struct {
	name       string
	predicates []string
}

func NewBlockState(name string, predicates ...string) BlockState {
	return BlockState{
		name:       name,
		predicates: predicates,
	}
}

type States struct {
	Match  string
	States []BlockState
}
