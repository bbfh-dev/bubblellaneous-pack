#! Generated using a script
scoreboard players set @s bbln.block.model 9
data modify entity @s item.components.minecraft:custom_data.bubblellaneous.block_properties.block_state set value "middle_left"

data modify storage bubblellaneous tmp.in set from entity @s item.components.minecraft:custom_data.bubblellaneous.block_data
data modify storage bubblellaneous tmp.in.index set value 9
function bubblellaneous:block/set_block_state_model with storage bubblellaneous tmp.in

$execute at @s run tp @s ~ ~ ~ ~$(rotation) ~
execute if entity @s[tag=--bbln.uses.blockstate_callback] run function bubblellaneous:block/vending_machine/blockstates/callback

