execute if score @s local.block.timer matches 1.. run return 0

execute if block ~ ~ ~ barrel[open=false] run function bubblellaneous:block/safe_block/close
execute if block ~ ~ ~ redstone_lamp[lit=true] run function bubblellaneous:block/safe_block/open with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data
