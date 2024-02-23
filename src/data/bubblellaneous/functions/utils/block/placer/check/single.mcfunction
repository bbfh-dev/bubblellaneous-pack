execute as @s[tag=--local.force_place,tag=!--local.uses.no_base] run setblock ~ ~ ~ air
execute as @s[tag=--local.uses.no_base] unless block ~ ~ ~ #bubblellaneous:air if entity @e[type=item_display,tag=local.block,distance=..0.5] run function bubblellaneous:utils/block/placer/return with entity @s Item.tag.block_data
execute as @s[tag=!--local.uses.no_base] unless block ~ ~ ~ #bubblellaneous:air run function bubblellaneous:utils/block/placer/return with entity @s Item.tag.block_data
execute if block ~ ~ ~ #bubblellaneous:air if entity @e[type=item_display,tag=local.block,distance=..0.5] run function bubblellaneous:utils/block/placer/return with entity @s Item.tag.block_data
execute as @s[tag=--local.uses.no_base] unless block ~ ~ ~ #bubblellaneous:air unless entity @e[type=item_display,tag=local.block,distance=..0.5] run function bubblellaneous:utils/block/placer/place/single with entity @s Item.tag.block_data
execute if block ~ ~ ~ #bubblellaneous:air unless entity @e[type=item_display,tag=local.block,distance=..0.5] run function bubblellaneous:utils/block/placer/place/single with entity @s Item.tag.block_data
