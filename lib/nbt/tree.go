package nbt

import (
	"fmt"
	"strings"
)

type TreeNBT map[string]Entry

func Tree() TreeNBT {
	return TreeNBT{}
}

func (tree TreeNBT) String() string {
	var values []string

	for key, value := range tree {
		values = append(values, fmt.Sprintf("%q: %s", key, value.String()))
	}

	return fmt.Sprintf("{%s}", strings.Join(values, ","))
}

func (tree TreeNBT) Set(key string, value Entry) TreeNBT {
	tree[key] = value
	return tree
}

func (tree TreeNBT) Extend(t TreeNBT) TreeNBT {
	for key, value := range t {
		tree[key] = value
	}

	return tree
}
