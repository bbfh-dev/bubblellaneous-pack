execute if score facing local.tmp matches 0..1 run function bubblellaneous:placer/return_block with entity @s Item.tag.bubblellaneous.block_data
execute if score facing local.tmp matches 2 if block ~ ~ ~1 #bubblellaneous:no_solid_collision run function bubblellaneous:placer/return_block with entity @s Item.tag.bubblellaneous.block_data
execute if score facing local.tmp matches 2 unless block ~ ~ ~1 #bubblellaneous:no_solid_collision run return 180
execute if score facing local.tmp matches 3 if block ~ ~ ~-1 #bubblellaneous:no_solid_collision run function bubblellaneous:placer/return_block with entity @s Item.tag.bubblellaneous.block_data
execute if score facing local.tmp matches 3 unless block ~ ~ ~-1 #bubblellaneous:no_solid_collision run return 0
execute if score facing local.tmp matches 4 if block ~1 ~ ~ #bubblellaneous:no_solid_collision run function bubblellaneous:placer/return_block with entity @s Item.tag.bubblellaneous.block_data
execute if score facing local.tmp matches 4 unless block ~1 ~ ~ #bubblellaneous:no_solid_collision run return 90
execute if score facing local.tmp matches 5 if block ~-1 ~ ~ #bubblellaneous:no_solid_collision run function bubblellaneous:placer/return_block with entity @s Item.tag.bubblellaneous.block_data
execute if score facing local.tmp matches 5 unless block ~-1 ~ ~ #bubblellaneous:no_solid_collision run return -90
return 0
