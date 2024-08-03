package main

import (
	"fmt"
	"os"

	"github.com/bbfh-dev/bubblellaneous-pack/bubblellaneous"
	"github.com/bbfh-dev/bubblellaneous-pack/bubblellaneous/unit"
	"github.com/bbfh-dev/bubblellaneous-pack/lib"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/code"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/lang"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/nbt"
)

const VERSION = "2.1.0"

func main() {
	if len(os.Args) < 3 {
		panic("Usage: main [output dir] [lang file]")
	}

	var registry = unit.NewCategory()
	registry.
		Add(bubblellaneous.Furniture.Units("furniture")...).
		Add(bubblellaneous.Food.Units("food")...).
		Add(bubblellaneous.Miscellaneous.Units("miscellaneous")...).
		Add(bubblellaneous.Technology.Units("technology")...).
		Sort()

	customModelData := 371000
	outputDir := os.Args[1]
	resourceDir := os.Args[2]
	langFile := os.Args[3]
	tree := lib.NewTree(resourceDir)

	for _, item := range registry.RawUnits() {
		customModelData += unit.Compile(
			item,
			*code.NewTemplate("mcfunction"),
			tree,
			customModelData,
		)
	}

	//region Baked block states
	node := nbt.Tree()
	for block, registry := range tree.StateRegistry {
		if len(registry) == 0 {
			continue
		}

		leaf := nbt.Tree()
		for key, value := range registry {
			leaf.Set(key, value.NBT())
		}
		node.Set(block, leaf)
	}
	code.NewTemplate("load_blockstates").
		Replace("registry", node.String()).
		Format().Write(tree)
	//endregion

	//region Bench registry
	code.NewTemplate("registry").
		Replace("version", VERSION).
		Replace("furniture", tree.Furnitures().String()).
		Replace("technology", tree.Technologies().String()).
		Replace("food", tree.Foods().String()).
		Replace("miscellaneous", tree.Miscellaneous().String()).
		Format().Write(tree)
	//endregistry

	tree.WriteToFileSystem(outputDir)
	fmt.Println(resourceDir)

	fmt.Printf(
		"Finished compiling %d units with %d models!\n",
		len(registry.RawUnits()),
		customModelData-371000,
	)

	tree.WriteLangFile(
		outputDir,
		lang.GetLangFile(lang.ReadFromFile(langFile)),
	)
}
