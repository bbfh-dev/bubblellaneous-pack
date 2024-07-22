package field

import (
	"fmt"
	"strings"
)

type BlockState struct {
	Name       string
	Predicates []string
}

func NewBlockState(name string, predicates ...string) BlockState {
	return BlockState{
		Name:       name,
		Predicates: predicates,
	}
}

func genPermutationsHelper(substr string, index int, current string, perms []string) []string {
	if index == len(substr) {
		return append(perms, current)
	}

	if substr[index] == '~' {
		return append(perms, append(
			genPermutationsHelper(substr, index+1, current+"0", perms),
			genPermutationsHelper(substr, index+1, current+"1", perms)...,
		)...)
	}

	return append(
		perms,
		genPermutationsHelper(
			substr,
			index+1,
			fmt.Sprintf("%s%s", current, string(substr[index])),
			perms,
		)...)
}

func genPermutations(predicate string) (permutations []string) {
	return genPermutationsHelper(predicate, 0, "", permutations)
}

func (state *BlockState) PredicatePermutations() (items []string) {
	for _, predicate := range state.Predicates {
		if !strings.Contains(predicate, "~") {
			items = append(items, predicate)
			continue
		}

		items = append(items, genPermutations(predicate)...)
	}

	return items
}

func StateRotation(state string) string {
	if !strings.Contains(state, ":") {
		return "0"
	}

	return strings.Split(state, ":")[1]
}

type States struct {
	Match  string
	States []BlockState
}

func (states *States) AbsMatch() string {
	return strings.TrimPrefix(states.Match, "!")
}

func (states *States) Condition() string {
	if strings.HasPrefix(states.Match, "!") {
		return "unless"
	}
	return "if"
}

func (states *States) Entity() string {
	if states.AbsMatch() == "@self" {
		return "@e[type=item_display,tag=local.name.[name],distance=..0.5]"
	}
	return states.AbsMatch()
}

func (states *States) BlockTag() string {
	return strings.ReplaceAll(states.AbsMatch(), "#", "#bubblellaneous:")
}

func (states *States) Predicate() string {
	if strings.HasPrefix(states.AbsMatch(), "@") {
		return fmt.Sprintf(
			"execute at @s positioned [coords] %s entity %s",
			states.Condition(),
			states.Entity(),
		)
	}

	return fmt.Sprintf("execute at @s %s block [coords] %s", states.Condition(), states.BlockTag())
}

type Direction struct {
	Name        string
	Coordinates string
	Negative    string
}

var DIRECTIONS = []Direction{
	{"front", "^ ^ ^1", "^ ^ ^-1"},
	{"back", "^ ^ ^-1", "^ ^ ^1"},
	{"left", "^-1 ^ ^", "^1 ^ ^"},
	{"right", "^1 ^ ^", "^-1 ^ ^"},
	{"up", "^ ^1 ^", "^ ^-1 ^"},
	{"down", "^ ^-1 ^", "^ ^1 ^"},
}
