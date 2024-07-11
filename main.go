package main

import (
	"fmt"
	"os"

	"github.com/bbfh-dev/bubblellaneous-pack/bubblellaneous"
	"github.com/bbfh-dev/bubblellaneous-pack/lib"
)

func main() {
	if len(os.Args) < 2 {
		panic("No output directory is provided!")
	}

	outputDir := os.Args[1]

	units := bubblellaneous.Furniture
	units = append(units, bubblellaneous.Food...)
	units = append(units, bubblellaneous.Technology...)
	units = append(units, bubblellaneous.Miscellaneous...)

	tree := lib.NewTree()

	customModelData := 371000

	for _, unit := range units {
		customModelData += bubblellaneous.Compile(tree, unit, customModelData)
	}

	tree.WriteToFileSystem(outputDir)
	fmt.Printf("Finished compiling %d units!\n", len(units))
}
