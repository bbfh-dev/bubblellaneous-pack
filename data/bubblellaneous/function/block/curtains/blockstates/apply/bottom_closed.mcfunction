#! Generated using a script
scoreboard players set @s bbln.block.model 3
data modify entity @s item.components.minecraft:custom_data.bubblellaneous.block_properties.block_state set value "bottom_closed"

data modify storage bubblellaneous tmp.in set from entity @s item.components.minecraft:custom_data.bubblellaneous.block_data
data modify storage bubblellaneous tmp.in.index set value 3
function bubblellaneous:block/set_block_state_model with storage bubblellaneous tmp.in

$execute at @s run tp @s ~ ~ ~ ~$(rotation) ~

