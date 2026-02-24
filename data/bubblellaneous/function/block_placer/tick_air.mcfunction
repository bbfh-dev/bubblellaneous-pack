execute unless score NO_REPLACE bbln.tmp matches 1 run function bubblellaneous:block_placer/return_block with entity @s Item.components.minecraft:custom_data.bubblellaneous.block_data
execute if score NO_REPLACE bbln.tmp matches 1 align xyz positioned ~0.5 ~0.5 ~0.5 run function bubblellaneous:block_placer/place with entity @s Item.components.minecraft:custom_data.bubblellaneous.block_data
