execute unless score @s[tag=--bbln.block.light_level_change] bbln.block.light_level = #light bbln.tmp run return run function bubblellaneous:blocks/uses/brightness_fix/set
execute unless score @s[tag=!--bbln.block.light_level_change] bbln.block.light_level = #light bbln.tmp run return run tag @s add --bbln.block.light_level_change
execute if score @s[tag=--bbln.block.light_level_change] bbln.block.light_level = #light bbln.tmp run tag @s remove --bbln.block.light_level_change
