function bubblellaneous:utils/block/placer/blockstates/update_neighbors with entity @s item.tag.block_data
$execute if entity @s[tag=--local.uses.all_dimensions] at @s rotated 0 0 run function bubblellaneous:blocks/$(id)/blockstate/update
$execute unless entity @s[tag=--local.uses.all_dimensions] run function bubblellaneous:blocks/$(id)/blockstate/update
