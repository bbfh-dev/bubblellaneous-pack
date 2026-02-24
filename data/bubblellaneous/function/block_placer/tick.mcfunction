function bubblellaneous:block_placer/ignore_block_properties
execute unless block ~ ~ ~ #bubblellaneous:air run function bubblellaneous:block_placer/tick_air
execute if block ~ ~ ~ #bubblellaneous:air align xyz positioned ~0.5 ~0.5 ~0.5 run function bubblellaneous:block_placer/place with entity @s Item.components.minecraft:custom_data.bubblellaneous.block_data
kill @s
