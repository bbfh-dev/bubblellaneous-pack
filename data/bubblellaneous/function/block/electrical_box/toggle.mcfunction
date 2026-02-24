execute store result score @s bbln.block_state if score @s bbln.block_state matches 0

execute if score @s bbln.block_state matches 0 run return run function bubblellaneous:block/electrical_box/enable
function bubblellaneous:block/electrical_box/disable
