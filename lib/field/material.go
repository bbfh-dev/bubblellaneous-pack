package field

import (
	"fmt"

	"github.com/bbfh-dev/bubblellaneous-pack/lib/util"
	"github.com/samber/lo"
)

type Material struct {
	Name      string
	Primary   string
	Secondary string
	Textures  map[string]string
}

func NewMaterial(
	name string,
	primary string,
	secondary string,
	textures map[string]string,
) Material {
	return Material{
		Name:      name,
		Primary:   primary,
		Secondary: secondary,
		Textures:  textures,
	}
}

var COLORS = []string{
	"white",
	"light_gray",
	"gray",
	"black",
	"brown",
	"red",
	"orange",
	"yellow",
	"lime",
	"green",
	"cyan",
	"light_blue",
	"blue",
	"purple",
	"magenta",
	"pink",
}

var WOODS = []string{
	"oak",
	"spruce",
	"birch",
	"jungle",
	"acacia",
	"dark_oak",
	"mangrove",
	"cherry",
	"bamboo",
	"crimson",
	"warped",
}

var SOLIDS = append(WOODS, []string{
	"stone",
	"deepslate",
	"iron",
	"gold",
	"emerald",
	"diamond",
	"netherite",
	"quartz",
	"copper",
}...)

var CARDS = []string{
	"two",
	"three",
	"four",
	"five",
	"six",
	"seven",
	"eight",
	"nine",
	"ten",
	"jack",
	"queen",
	"king",
	"ace",
}

var WOOD_MATERIAL = []Material{
	NewMaterial(
		"oak",
		"oak_planks",
		"dark_oak_log",
		map[string]string{"base": "oak_planks"},
	),
	NewMaterial(
		"acacia",
		"acacia_planks",
		"acacia_log",
		map[string]string{"base": "acacia_planks"},
	),
	NewMaterial(
		"bamboo",
		"bamboo_planks",
		"bamboo_fence_particle",
		map[string]string{"base": "bamboo_planks"},
	),
	NewMaterial(
		"birch",
		"birch_planks",
		"birch_log",
		map[string]string{"base": "birch_planks"},
	),
	NewMaterial(
		"cherry",
		"cherry_planks",
		"cherry_log",
		map[string]string{"base": "cherry_planks"},
	),
	NewMaterial(
		"crimson",
		"crimson_planks",
		"warped_stem",
		map[string]string{"base": "crimson_planks"},
	),
	NewMaterial(
		"dark_oak",
		"dark_oak_planks",
		"oak_log",
		map[string]string{"base": "dark_oak_planks"},
	),
	NewMaterial(
		"jungle",
		"jungle_planks",
		"mangrove_log",
		map[string]string{"base": "jungle_planks"},
	),
	NewMaterial(
		"mangrove",
		"mangrove_planks",
		"cherry_log",
		map[string]string{"base": "mangrove_planks"},
	),
	NewMaterial(
		"spruce",
		"spruce_planks",
		"spruce_log",
		map[string]string{"base": "spruce_planks"},
	),
	NewMaterial(
		"warped",
		"warped_planks",
		"crimson_stem",
		map[string]string{"base": "warped_planks"},
	),
}

var WOOL_MATERIAL = lo.Map(COLORS, func(item string, _ int) Material {
	return NewMaterial(
		item,
		fmt.Sprintf("%s_wool", item),
		fmt.Sprintf("%s_terracotta", item),
		map[string]string{"color": fmt.Sprintf("%s_wool", item)},
	)
})

var DYE_MATERIAL = lo.Map(COLORS, func(item string, _ int) Material {
	return NewMaterial(
		item,
		item,
		fmt.Sprintf("%s_terracotta", item),
		map[string]string{"color": fmt.Sprintf("%s_dye", item)},
	)
})

func CARD_DECK_MATERIAL() (materials []Material) {
	for _, card := range CARDS {
		for _, deck := range []string{"spades", "clubs", "hearts", "diamonds"} {
			name := fmt.Sprintf("%s_%s", deck, card)
			materials = append(materials, NewMaterial(name, name, name, nil))
		}
	}

	return materials
}

var WOOD_WITH_WOOL_MATERIAL = lo.Map(
	util.Product(WOOD_MATERIAL, WOOL_MATERIAL),
	func(item [2]Material, _ int) Material {
		wood, wool := item[0], item[1]
		return NewMaterial(
			fmt.Sprintf("%s_%s", wool.Name, wood.Name),
			wood.Primary,
			wool.Primary,
			util.Merge(wood.Textures, wool.Textures),
		)
	},
)

var SOLID_MATERIAL = append(WOOD_MATERIAL, []Material{
	NewMaterial(
		"stone",
		"stone",
		"smooth_stone",
		map[string]string{"base": "stone"},
	),
	NewMaterial(
		"deepslate",
		"deepslate",
		"cut_copper",
		map[string]string{"base": "deepslate"},
	),
	NewMaterial(
		"quartz",
		"quartz_block_side",
		"deepslate_tiles",
		map[string]string{"base": "quartz_block"},
	),
	NewMaterial(
		"iron",
		"iron_block",
		"smithing_table_top",
		map[string]string{"base": "iron_block"},
	),
	NewMaterial(
		"copper",
		"copper_block",
		"smithing_table_top",
		map[string]string{"base": "copper_block"},
	),
	NewMaterial(
		"gold",
		"gold_block",
		"raw_gold_block",
		map[string]string{"base": "gold_block"},
	),
	NewMaterial(
		"diamond",
		"diamond_block",
		"smithing_table_top",
		map[string]string{"base": "diamond_block"},
	),
	NewMaterial(
		"emerald",
		"emerald_block",
		"smithing_table_top",
		map[string]string{"base": "emerald_block"},
	),
	NewMaterial(
		"netherite",
		"netherite_block",
		"smithing_table_top",
		map[string]string{"base": "netherite_block"},
	),
}...)
