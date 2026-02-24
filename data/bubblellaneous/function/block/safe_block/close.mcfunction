data modify entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.items set from block ~ ~ ~ Items
setblock ~ ~ ~ air
setblock ~ ~ ~ redstone_lamp keep
execute if block ^ ^ ^1 minecraft:air run function bubblellaneous:block/safe_block/blockstates/update_air
execute if block ^ ^ ^1 minecraft:cave_air run function bubblellaneous:block/safe_block/blockstates/update_cave_air
execute if block ^ ^ ^1 minecraft:void_air run function bubblellaneous:block/safe_block/blockstates/update_void_air
execute if block ~ ~ ~ minecraft:redstone_lamp[lit=true] run return run function bubblellaneous:block/safe_block/open_silent with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data

playsound bubblellaneous:block.safe_block.close block @a[distance=..16] ~ ~ ~ 0.5 1 0

scoreboard players set @s bbln.block_state 0
function bubblellaneous:block_placer/internal/apply_blockstate {name: "default", rotation: 0}
