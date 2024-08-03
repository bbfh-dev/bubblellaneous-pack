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
	ResourceDir                string
	functions                  map[string][]string
	loot_tables                map[string]string
	models                     map[string]string
	toBeDeleted                []string
	customModelDatas           map[string]map[int]string
	StateRegistry              map[string]map[string]stateRegistry
	BenchRegistry              map[string][]benchRegistry
	BenchRegistryFurniture     []benchRegistry
	BenchRegistryTechnology    []benchRegistry
	BenchRegistryMiscellaneous []benchRegistry
	BenchRegistryFood          []benchRegistry
}

func NewTree(resourceDir string) *Tree {
	return &Tree{
		ResourceDir:                resourceDir,
		functions:                  map[string][]string{},
		loot_tables:                map[string]string{},
		models:                     map[string]string{},
		toBeDeleted:                []string{},
		customModelDatas:           map[string]map[int]string{},
		StateRegistry:              map[string]map[string]stateRegistry{},
		BenchRegistry:              map[string][]benchRegistry{},
		BenchRegistryFurniture:     []benchRegistry{},
		BenchRegistryTechnology:    []benchRegistry{},
		BenchRegistryMiscellaneous: []benchRegistry{},
		BenchRegistryFood:          []benchRegistry{},
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

type benchRegistry struct {
	Group string
	Entry string
	Item  string
}

func (tree *Tree) MkBenchRegistry(category string, entry string, item string, group string) {
	treeEntry := benchRegistry{
		Group: group,
		Entry: entry,
		Item:  item,
	}

	switch category {
	case "furniture":
		tree.BenchRegistryFurniture = append(tree.BenchRegistryFurniture, treeEntry)
	case "technology":
		tree.BenchRegistryTechnology = append(tree.BenchRegistryTechnology, treeEntry)
	case "miscellaneous":
		tree.BenchRegistryMiscellaneous = append(tree.BenchRegistryMiscellaneous, treeEntry)
	case "food":
		tree.BenchRegistryFood = append(tree.BenchRegistryFood, treeEntry)
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

type group struct {
	Items []nbt.StringNBT
	Entry string
}

func getCategory(from []benchRegistry) nbt.ListNBT[nbt.TreeNBT] {
	result := nbt.ListNBT[nbt.TreeNBT]{}

	var indexes = map[string]int{}
	var groups []group

	for _, entry := range from {
		index, ok := indexes[entry.Group]
		if !ok {
			indexes[entry.Group] = len(groups)
			index = len(groups)
			groups = append(groups, group{
				Items: []nbt.StringNBT{nbt.StringNBT(entry.Item)},
				Entry: entry.Entry,
			})
		} else {
			group := groups[index]
			group.Items = append(group.Items, nbt.StringNBT(entry.Item))
			groups[index] = group
		}
	}

	for i, group := range groups {
		// Create a map from wood type to index
		woodIndex := make(map[string]int)
		for i, wood := range field.COLORS {
			woodIndex[wood] = i
		}

		// Create a map from wood type to index
		solidIndex := make(map[string]int)
		for i, wood := range field.SOLIDS {
			solidIndex[wood] = i
		}

		// Custom sort function
		sort.Slice(group.Items, func(i, j int) bool {
			// Extract the prefix from each item
			var AprefixI, AprefixJ string
			for _, wood := range field.SOLIDS {
				if strings.HasPrefix(group.Items[i].Item(), wood) {
					AprefixI = wood
					break
				}
			}
			for _, wood := range field.SOLIDS {
				if strings.HasPrefix(group.Items[j].Item(), wood) {
					AprefixJ = wood
					break
				}
			}

			// Extract the prefix from each item
			var prefixI, prefixJ string
			for _, wood := range field.COLORS {
				if strings.HasPrefix(group.Items[i].Item(), wood) {
					prefixI = wood
					break
				}
			}
			for _, wood := range field.COLORS {
				if strings.HasPrefix(group.Items[j].Item(), wood) {
					prefixJ = wood
					break
				}
			}

			// Compare the indices of the prefixes
			a := woodIndex[prefixI] < woodIndex[prefixJ]
			b := solidIndex[AprefixI] < solidIndex[AprefixJ]
			return b || a
		})

		if len(group.Items) < 2 {
			result = append(
				result,
				nbt.Tree().
					Set("entry", nbt.StringNBT(group.Entry)).
					Set("item", nbt.StringNBT(group.Items[0])).
					Set("count", nbt.IntNBT(0)).
					Set("index", nbt.IntNBT(i)).
					Set("items", nbt.ListNBT[nbt.StringNBT]{}),
			)
		} else {
			result = append(
				result,
				nbt.Tree().
					Set("entry", nbt.StringNBT(group.Entry)).
					Set("item", nbt.StringNBT(group.Items[0])).
					Set("count", nbt.IntNBT(len(group.Items))).
					Set("index", nbt.IntNBT(i)).
					Set("items", nbt.ListNBT[nbt.StringNBT](group.Items)),
			)
		}
	}

	return result
}

func (tree *Tree) Furnitures() nbt.ListNBT[nbt.TreeNBT] {
	return getCategory(tree.BenchRegistryFurniture)
}

func (tree *Tree) Technologies() nbt.ListNBT[nbt.TreeNBT] {
	return getCategory(tree.BenchRegistryTechnology)
}

func (tree *Tree) Foods() nbt.ListNBT[nbt.TreeNBT] {
	return getCategory(tree.BenchRegistryFood)
}

func (tree *Tree) Miscellaneous() nbt.ListNBT[nbt.TreeNBT] {
	return getCategory(tree.BenchRegistryMiscellaneous)
}
