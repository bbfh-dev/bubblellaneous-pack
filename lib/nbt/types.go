package nbt

import (
	"fmt"
	"strings"

	"github.com/samber/lo"
)

type RawNBT string

func (nbt RawNBT) String() string {
	return fmt.Sprintf("%s", string(nbt))
}

type JSONFloatNBT float64

func (nbt JSONFloatNBT) String() string {
	return fmt.Sprintf("%f", nbt)
}

type ByteNBT int8

func (nbt ByteNBT) String() string {
	return fmt.Sprintf("%db", nbt)
}

type BooleanNBT bool

func (nbt BooleanNBT) String() string {
	if nbt {
		return "true"
	}

	return "false"
}

type ShortNBT int16

func (nbt ShortNBT) String() string {
	return fmt.Sprintf("%ds", nbt)
}

type IntNBT int32

func (nbt IntNBT) String() string {
	return fmt.Sprintf("%d", nbt)
}

type LongNBT int64

func (nbt LongNBT) String() string {
	return fmt.Sprintf("%dL", nbt)
}

type FloatNBT float32

func (nbt FloatNBT) String() string {
	return fmt.Sprintf("%f.0f", nbt)
}

type DoubleNBT float64

func (nbt DoubleNBT) String() string {
	if value := fmt.Sprintf("%fd", nbt); strings.Contains(value, ".0") {
		return fmt.Sprintf("%s.0d", strings.SplitN(value, ".", 1)[0])
	}

	return fmt.Sprintf("%f.0d", nbt)
}

type StringNBT string

func (nbt StringNBT) String() string {
	return fmt.Sprintf("%q", string(nbt))
}

func (nbt StringNBT) Item() string {
	parts := strings.Split(nbt.String(), "/")
	if len(parts) < 2 {
		return parts[0]
	}

	return parts[1]
}

type ListNBT[T Entry] []T

func (nbt ListNBT[V]) String() string {
	return fmt.Sprintf(
		"[%s]",
		strings.Join(lo.Map(nbt, func(item V, _ int) string {
			return item.String()
		}), ","),
	)
}

type ByteArray []ByteNBT

func (nbt ByteArray) String() string {
	return fmt.Sprintf(
		"[B;%s]",
		strings.Join(lo.Map(nbt, func(item ByteNBT, _ int) string {
			return item.String()
		}), ","),
	)
}

type IntArray []IntNBT

func (nbt IntArray) String() string {
	return fmt.Sprintf(
		"[I;%s]",
		strings.Join(lo.Map(nbt, func(item IntNBT, _ int) string {
			return item.String()
		}), ","),
	)
}

type LongArray []LongNBT

func (nbt LongArray) String() string {
	return fmt.Sprintf(
		"[L;%s]",
		strings.Join(lo.Map(nbt, func(item LongNBT, _ int) string {
			return item.String()
		}), ","),
	)
}
