$data modify entity @s item.components.minecraft:custom_data.bubblellaneous.block_properties.block_state set value "$(name)"

data modify storage bubblellaneous tmp.in set from entity @s item.components.minecraft:custom_data.bubblellaneous.block_data
$data modify storage bubblellaneous tmp.in.block_state set value "$(name)"
function bubblellaneous:block/_set_model with storage bubblellaneous tmp.in

$execute at @s run tp @s ~ ~ ~ ~$(rotation) ~
execute if entity @s[tag=--bbln.uses.blockstate_callback] run function bubblellaneous:block/hatch/blockstates/callback

