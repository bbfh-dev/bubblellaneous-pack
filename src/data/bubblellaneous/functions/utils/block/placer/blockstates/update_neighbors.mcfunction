execute if entity @s[tag=--local.uses.all_dimensions] run function bubblellaneous:utils/block/placer/blockstates/update_neighbors/no_rotation with entity @s item.tag.block_data
execute unless entity @s[tag=--local.uses.all_dimensions] run function bubblellaneous:utils/block/placer/blockstates/update_neighbors/regular with entity @s item.tag.block_data
