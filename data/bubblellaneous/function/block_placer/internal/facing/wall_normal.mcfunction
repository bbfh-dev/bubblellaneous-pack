execute if score facing bbln.tmp matches 0..1 run return run function bubblellaneous:block_placer/return_block with entity @s Item.components.minecraft:custom_data.bubblellaneous.block_data
execute if score facing bbln.tmp matches 2 unless block ~ ~ ~1 #bubblellaneous:no_solid_collision run return 180
execute if score facing bbln.tmp matches 3 unless block ~ ~ ~-1 #bubblellaneous:no_solid_collision run return 0
execute if score facing bbln.tmp matches 4 unless block ~1 ~ ~ #bubblellaneous:no_solid_collision run return 90
execute if score facing bbln.tmp matches 5 unless block ~-1 ~ ~ #bubblellaneous:no_solid_collision run return -90
function bubblellaneous:block_placer/return_block with entity @s Item.components.minecraft:custom_data.bubblellaneous.block_data
return 0
