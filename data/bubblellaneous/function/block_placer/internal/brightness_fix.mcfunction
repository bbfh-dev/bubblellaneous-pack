data modify entity @s brightness set value {block: 0, sky: 0}
tag @s add --bbln.uses.brightness_fix
tag @s add --bbln.block.light_level_change
scoreboard players set @s bbln.block.light_level 0
function bubblellaneous:blocks/uses/brightness_fix/light_current
