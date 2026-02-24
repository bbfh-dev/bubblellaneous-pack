tag @s remove --bbln.block.light_level_change
execute store result entity @s brightness.block int 1 run scoreboard players get #light bbln.tmp
scoreboard players operation @s bbln.block.light_level = #light bbln.tmp
