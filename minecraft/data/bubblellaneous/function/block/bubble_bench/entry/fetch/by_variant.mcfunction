data modify storage bubblellaneous tmp.entry set value {count: 0}
$data modify storage bubblellaneous tmp.entry.item set from entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.items[$(index)]
