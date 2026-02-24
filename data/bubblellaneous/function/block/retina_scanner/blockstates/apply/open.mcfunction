#! Generated using a script
scoreboard players set @s bbln.block.model 2
data modify entity @s item.components.minecraft:custom_data.bubblellaneous.block_properties.block_state set value "open"

data modify storage bubblellaneous tmp.in set from entity @s item.components.minecraft:custom_data.bubblellaneous.block_data
data modify storage bubblellaneous tmp.in.index set value 2
function bubblellaneous:block/set_block_state_model with storage bubblellaneous tmp.in

$execute at @s run tp @s ~ ~ ~ ~$(rotation) ~
execute if entity @s[tag=--bbln.uses.blockstate_callback] run function bubblellaneous:block/retina_scanner/blockstates/callback

