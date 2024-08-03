data modify entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.items set from block ~ ~ ~ Items
setblock ~ ~ ~ redstone_lamp

function bubblellaneous:block/safe_block/blockstates/apply/default {rotation: 0}

scoreboard players set @s local.block_state 0

execute if block ^ ^ ^1 #bubblellaneous:air run function bubblellaneous:block/safe_block/update
execute if block ~ ~ ~ redstone_lamp[lit=false] run playsound bubblellaneous:block.safe_block.close block @a ~ ~ ~ 1 1 0
