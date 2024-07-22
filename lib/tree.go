package lib

import (
	"encoding/json"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"sort"
	"strings"

	"github.com/bbfh-dev/bubblellaneous-pack/lib/field"
	"github.com/bbfh-dev/bubblellaneous-pack/lib/nbt"
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
	ResourceDir      string
	functions        map[string][]string
	loot_tables      map[string]string
	models           map[string]string
	toBeDeleted      []string
	customModelDatas map[string]map[int]string
	StateRegistry    map[string]map[string]stateRegistry
}

func NewTree(resourceDir string) *Tree {
	return &Tree{
		ResourceDir:      resourceDir,
		functions:        map[string][]string{},
		loot_tables:      map[string]string{},
		models:           map[string]string{},
		toBeDeleted:      []string{},
		customModelDatas: map[string]map[int]string{},
		StateRegistry:    map[string]map[string]stateRegistry{},
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

type stateRegistry struct {
	Name     string
	Rotation string
}

func (registry stateRegistry) NBT() nbt.TreeNBT {
	return nbt.Tree().
		Set("name", nbt.StringNBT(registry.Name)).
		Set("rotation", nbt.StringNBT(registry.Rotation))
}

func (tree *Tree) MkStateRegistry(block string, states []field.BlockState) {
	var items []map[string]stateRegistry
	for _, state := range states {
		entry := map[string]stateRegistry{}
		for _, predicate := range state.PredicatePermutations() {
			parts := strings.SplitN(predicate, ":", 2)
			key := parts[0]
			key = strings.ReplaceAll(key, "0", "o")
			key = strings.ReplaceAll(key, "1", "i")
			key = strings.ReplaceAll(key, "~", "x")
			entry[key] = stateRegistry{
				Name:     state.Name,
				Rotation: field.StateRotation(predicate),
			}
		}
		items = append(items, entry)
	}

	final := map[string]stateRegistry{}
	for _, subdata := range items {
		for key, value := range subdata {
			final[key] = value
		}
	}
	tree.StateRegistry[block] = final
}

func (tree *Tree) AddModel(base string, customModelData int, target string) {
	if _, ok := tree.customModelDatas[base]; !ok {
		tree.customModelDatas[base] = map[int]string{}
	}
	tree.customModelDatas[base][customModelData] = util.GamePath(target)
}

func (tree *Tree) MkModel(
	customModelData int,
	base string,
	fn func(string) string,
	from string,
	to string,
) {
	from = fmt.Sprintf("%s.json", from)
	data, err := os.ReadFile(from)
	if err != nil {
		panic(err)
	}
	tree.toBeDeleted = append(tree.toBeDeleted, from)
	tree.models[to] = fn(string(data))

	tree.AddModel(base, customModelData, to)
}

func (tree *Tree) MkModelDir(
	customModelData int,
	base string,
	fn func(string) string,
	from string,
	to string,
) {
	entries, err := os.ReadDir(from)
	if err != nil {
		panic(err)
	}

	for i, entry := range entries {
		path := filepath.Join(from, entry.Name())
		data, err := os.ReadFile(path)
		if err != nil {
			panic(err)
		}
		target := filepath.Join(to, entry.Name())
		tree.toBeDeleted = append(tree.toBeDeleted, path)
		tree.models[target] = fn(string(data))

		tree.AddModel(base, customModelData+i, target)
	}
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

	for target, body := range tree.models {
		file := create(fmt.Sprintf("%s/assets/%s.json", path, target))
		file.WriteString(body)
	}

	for base, customModelDatas := range tree.customModelDatas {
		data, ok := field.ITEM_BASES[base]
		if !ok {
			log.Panicf("Unknown item base %q (not defined in field.ITEM_BASES)", base)
		}

		var keys []int
		for key := range customModelDatas {
			keys = append(keys, key)
		}
		sort.Ints(keys)

		var overrides []string
		for _, key := range keys {
			overrides = append(
				overrides,
				strings.Replace(
					strings.Replace(
						field.ITEM_BASES["#override"],
						"[custom_model_data]",
						fmt.Sprintf("%d", key),
						1,
					),
					"[model]",
					fmt.Sprintf("%q", customModelDatas[key]),
					1,
				),
			)
		}
		data = strings.Replace(
			data,
			"[overrides]",
			fmt.Sprintf("[%s]", strings.Join(overrides, ",")),
			1,
		)

		file := create(
			fmt.Sprintf("%s/assets/minecraft/models/item/%s.json", path, util.NoNamespace(base)),
		)
		file.WriteString(data)
	}

	for _, path := range tree.toBeDeleted {
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
