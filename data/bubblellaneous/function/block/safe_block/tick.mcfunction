execute if block ~ ~ ~ barrel run data modify entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.items set from block ~ ~ ~ Items

execute if score @s bbln.block.timer matches 1.. run return 0

execute if block ~ ~ ~ barrel[open=false] run function bubblellaneous:block/safe_block/close
execute if block ~ ~ ~ redstone_lamp[lit=true] run function bubblellaneous:block/safe_block/open
