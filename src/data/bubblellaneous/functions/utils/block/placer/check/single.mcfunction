execute as @s[tag=--local.force_place] run setblock ~ ~ ~ air
execute unless block ~ ~ ~ #bubblellaneous:air run function bubblellaneous:utils/block/placer/return with entity @s Item.tag.block_data
execute if block ~ ~ ~ #bubblellaneous:air run function bubblellaneous:utils/block/placer/place/single with entity @s Item.tag.block_data
