data modify storage bubblellaneous tmp.input set value {group: "block"}
data modify storage bubblellaneous tmp.input.name set from storage bubblellaneous tmp.entry.tag.EntityTag.Item.tag.bubblellaneous.block_data.id
data modify storage bubblellaneous tmp.input.category set from entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.category
function bubblellaneous:block/bubble_bench/variant/expand/generic with storage bubblellaneous tmp.input
