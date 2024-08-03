package nbt

import (
	"fmt"
	"strings"
)

type snbt map[string]Entry

func sNBT() snbt {
	return snbt{}
}

func (snbt snbt) String() string {
	var values []string

	for key, value := range snbt {
		values = append(values, fmt.Sprintf("%s: %s", key, value.String()))
	}

	return fmt.Sprintf("{%s}", strings.Join(values, ","))
}
