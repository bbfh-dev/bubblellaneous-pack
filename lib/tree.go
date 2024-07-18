package lib

import (
	"encoding/json"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strings"

	"github.com/bbfh-dev/bubblellaneous-pack/lib/util"
)

func create(path string) *os.File {
	if err := os.MkdirAll(filepath.Dir(path), 0777); err != nil {
		panic(err)
	}

	file, err := os.Create(path)
	if err != nil {
		panic(err)
	}

	return file
}

type Tree struct {
	ResourceDir string
	functions   map[string][]string
	loot_tables map[string]string
	models      []modelCreator
}

func NewTree(resourceDir string) *Tree {
	return &Tree{
		ResourceDir: resourceDir,
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

func (tree *Tree) MkModel() *modelCreator {
	return &modelCreator{
		tree: tree,
		from: "",
		to:   "",
		dir:  true,
	}
}

func (tree *Tree) SetModel(from string, to string, dir bool) {
	tree.models = append(tree.models, modelCreator{
		tree: nil,
		from: from,
		to:   to,
		dir:  dir,
	})
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

	var toBeDeleted []string
	for _, model := range tree.models {
		if model.dir {
			continue
		}
		fmt.Println(model.to)

		from := fmt.Sprintf("%s.json", model.from)
		data, err := os.ReadFile(from)
		if err != nil {
			panic(err)
		}

		toBeDeleted = append(toBeDeleted, from)

		file := create(fmt.Sprintf("%s/assets/%s.json", path, model.to))
		file.WriteString(string(data))
	}

	for _, path := range toBeDeleted {
		os.Remove(path)
	}
}

func (tree *Tree) WriteLangFile(path string, langFile map[string]map[string]string) {
	for key, lang := range langFile {
		file := create(fmt.Sprintf("%s/assets/minecraft/lang/%s.json", path, key))
		data, err := json.MarshalIndent(lang, "", "\t")
		if err != nil {
			panic(err)
		}
		file.Write(data)
		file.WriteString("\n")
	}
}
