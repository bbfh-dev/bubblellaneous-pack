package field

import "github.com/bbfh-dev/bubblellaneous-pack/lib/nbt"

var DEFAULT_BLOCK_TYPE = *NewBlockType("default", nil)

type BlockType struct {
	name   string
	params map[string]nbt.Entry
}

func NewBlockType(name string, params map[string]nbt.Entry) *BlockType {
	return &BlockType{
		name:   name,
		params: params,
	}
}

func (blockType BlockType) NBT() nbt.TreeNBT {
	if blockType.params == nil {
		return nbt.Tree()
	}

	params := nbt.Tree()
	for key, value := range blockType.params {
		params.Set(key, value)
	}

	return nbt.Tree().Set("name", nbt.StringNBT(blockType.name)).Set("parameters", params)
}

func ShelfBlock(amount int, offset float64) *BlockType {
	return NewBlockType("shelf", map[string]nbt.Entry{
		"amount": nbt.IntNBT(amount),
		"offset": nbt.JSONFloatNBT(offset),
	})
}

func SeatBlock(width float64, height float64) *BlockType {
	return NewBlockType("seat", map[string]nbt.Entry{
		"width":  nbt.JSONFloatNBT(width),
		"height": nbt.JSONFloatNBT(height),
	})
}

func LightBlock(light_level int) *BlockType {
	return NewBlockType("light", map[string]nbt.Entry{
		"light_level": nbt.IntNBT(light_level),
	})
}
