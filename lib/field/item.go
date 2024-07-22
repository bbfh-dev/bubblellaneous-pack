package field

var ITEM_BASES = map[string]string{
	"minecraft:carrot_on_a_stick": `{
        "parent": "minecraft:item/handheld_rod",
        "textures": {"layer0": "minecraft:item/carrot_on_a_stick"},
        "overrides": [overrides]
    }`,
	"minecraft:item_frame": `{
        "parent": "minecraft:item/generated",
        "textures": {"layer0": "minecraft:item/item_frame"},
        "overrides": [overrides]
    }`,
	"minecraft:firework_star": `{
        "parent": "minecraft:item/generated",
        "textures": {"layer0": "minecraft:item/firework_star"},
        "overrides": [overrides]
    }`,
	"#override": `{
		"predicate": {
			"custom_model_data": [custom_model_data]
		},
		"model": [model]
	}`,
}

const (
	ITEM_INTERACTIVE = "minecraft:carrot_on_a_stick"
	ITEM_NORMAL      = "minecraft:firework_star"
)
