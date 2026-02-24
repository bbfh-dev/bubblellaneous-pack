function bubblellaneous:blocks/uses/brightness_fix/light_current
scoreboard players operation #id_test bbln.tmp = @s bbln.block.id
execute as @e[type=#bubblellaneous:display,tag=!bbln.block,predicate=bubblellaneous:check/block.id,distance=..1] store result entity @s brightness.block int 1 run scoreboard players get #light bbln.tmp
