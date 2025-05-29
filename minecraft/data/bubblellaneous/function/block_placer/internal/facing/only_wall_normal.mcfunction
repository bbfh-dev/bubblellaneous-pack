execute if score facing local.tmp matches 0..1 facing entity @p[gamemode=!spectator] feet run return run function bubblellaneous:block_placer/internal/facing/player

execute if score facing local.tmp matches 2 if block ~ ~ ~1 #bubblellaneous:no_solid_collision run function bubblellaneous:block_placer/return_block with entity @s item.components.minecraft:custom_data.bubblellaneous.block_data
execute if score facing local.tmp matches 2 unless block ~ ~ ~1 #bubblellaneous:no_solid_collision run return 180
execute if score facing local.tmp matches 3 if block ~ ~ ~-1 #bubblellaneous:no_solid_collision run function bubblellaneous:block_placer/return_block with entity @s item.components.minecraft:custom_data.bubblellaneous.block_data
execute if score facing local.tmp matches 3 unless block ~ ~ ~-1 #bubblellaneous:no_solid_collision run return 0
execute if score facing local.tmp matches 4 if block ~1 ~ ~ #bubblellaneous:no_solid_collision run function bubblellaneous:block_placer/return_block with entity @s item.components.minecraft:custom_data.bubblellaneous.block_data
execute if score facing local.tmp matches 4 unless block ~1 ~ ~ #bubblellaneous:no_solid_collision run return 90
execute if score facing local.tmp matches 5 if block ~-1 ~ ~ #bubblellaneous:no_solid_collision run function bubblellaneous:block_placer/return_block with entity @s item.components.minecraft:custom_data.bubblellaneous.block_data
execute if score facing local.tmp matches 5 unless block ~-1 ~ ~ #bubblellaneous:no_solid_collision run return -90
return 0
