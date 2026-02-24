data modify entity @s brightness set value {sky: 0, block: 0}
scoreboard players set @s bbln.block.light_level 0
tag @s add --bbln.block.light_level_change
function bubblellaneous:blocks/uses/brightness_fix/light_current
