package lib

import (
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strings"

	"github.com/bbfh-dev/bubblellaneous-pack/lib/util"
)

func create(path string) *os.File {
	if err := os.MkdirAll(filepath.Dir(path), 0770); err != nil {
		panic(err)
	}

	file, err := os.Create(path)
	if err != nil {
		panic(err)
	}

	return file
}

type Tree struct {
	functions   map[string][]string
	loot_tables map[string]string
}

func NewTree() *Tree {
	return &Tree{
		functions:   map[string][]string{},
		loot_tables: map[string]string{},
	}
}

func (tree *Tree) MkFunction(path string, lines []string) {
	realPath := util.RealPath("function", path)

	if function, ok := tree.functions[realPath]; ok {
		tree.functions[realPath] = append(function, lines...)
	} else {
		tree.functions[realPath] = lines
	}
}

func (tree *Tree) MkLootTable(path string, body string) {
	realPath := util.RealPath("loot_table", path)

	if _, ok := tree.loot_tables[realPath]; ok {
		log.Panicf("Loot table %q already exists!", path)
	}

	tree.loot_tables[realPath] = body
}

func (tree *Tree) WriteToFileSystem(path string) {
	for fn, body := range tree.functions {
		file := create(fmt.Sprintf("%s/data/%s.mcfunction", path, fn))
		file.WriteString("#! Generated using a script\n")
		file.WriteString(strings.Join(body, "\n"))
	}

	for lt, body := range tree.loot_tables {
		file := create(fmt.Sprintf("%s/data/%s.json", path, lt))
		file.WriteString(body)
	}
}
