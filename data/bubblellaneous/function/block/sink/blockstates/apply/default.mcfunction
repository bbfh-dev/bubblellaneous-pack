#! Generated using a script
scoreboard players set @s bbln.block.model 0
tag @s remove --bbln.uses.tick
data modify entity @s item.components.minecraft:custom_data.bubblellaneous.block_properties.block_state set value "default"

data modify storage bubblellaneous tmp.in set from entity @s item.components.minecraft:custom_data.bubblellaneous.block_data
data modify storage bubblellaneous tmp.in.index set value 0
function bubblellaneous:block/set_block_state_model with storage bubblellaneous tmp.in

$execute at @s run rotate @s ~$(rotation) ~