package nbt

import (
	"fmt"
	"strings"
)

type tree map[string]Entry

func Tree() tree {
	return tree{}
}

func (tree tree) String() string {
	var values []string

	for key, value := range tree {
		values = append(values, fmt.Sprintf("%q: %s", key, value.String()))
	}

	return fmt.Sprintf("{%s}", strings.Join(values, ","))
}

func (tree tree) Set(key string, value Entry) tree {
	tree[key] = value
	return tree
}

func (tree tree) Extend(t tree) tree {
	for key, value := range t {
		tree[key] = value
	}

	return tree
}
