data modify storage bubblellaneous tmp.input set value {group: "item"}
data modify storage bubblellaneous tmp.input.category set from entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.category
data modify storage bubblellaneous tmp.input.name set from storage bubblellaneous tmp.entry.components.minecraft:custom_data.bubblellaneous.item_data.id
function bubblellaneous:block/bubble_bench/variant/expand/generic with storage bubblellaneous tmp.input
