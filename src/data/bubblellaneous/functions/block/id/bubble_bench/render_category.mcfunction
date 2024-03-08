data modify storage bubblellaneous tmp.in.category set from entity @s item.tag.bubblellaneous.block_properties.category
execute if data storage bubblellaneous tmp.in{category: "furniture"} run function bubblellaneous:block/id/bubble_bench/render/generic_category {category: "furniture"}
execute if data storage bubblellaneous tmp.in{category: "technology"} run function bubblellaneous:block/id/bubble_bench/render/generic_category {category: "technology"}
execute if data storage bubblellaneous tmp.in{category: "food"} run function bubblellaneous:block/id/bubble_bench/render/generic_category {category: "food"}
execute if data storage bubblellaneous tmp.in{category: "miscellaneous"} run function bubblellaneous:block/id/bubble_bench/render/generic_category {category: "miscellaneous"}
