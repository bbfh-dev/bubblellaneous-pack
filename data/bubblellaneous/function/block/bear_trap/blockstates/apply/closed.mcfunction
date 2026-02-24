#! Generated using a script
scoreboard players set @s bbln.block.model 1
scoreboard players operation @s bbln.block.timer = #bear_trap.time bbln.settings
data modify entity @s item.components.minecraft:custom_data.bubblellaneous.block_properties.block_state set value "closed"

data modify storage bubblellaneous tmp.in set from entity @s item.components.minecraft:custom_data.bubblellaneous.block_data
data modify storage bubblellaneous tmp.in.index set value 1
function bubblellaneous:block/set_block_state_model with storage bubblellaneous tmp.in

$execute at @s run rotate @s ~$(rotation) ~
