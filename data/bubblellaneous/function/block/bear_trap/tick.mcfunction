execute if score @s bbln.block_state matches 1 unless predicate bubblellaneous:check/have_passenger run return run function bubblellaneous:block/bear_trap/catching
execute if score @s bbln.block.timer matches 1.. run return 0
execute unless entity @e[type=#bubblellaneous:living,distance=..16,limit=1] run return 0

tag @s add --bbln.this
execute positioned ~-0.0625 ~-0.0625 ~-0.0625 as @e[type=#bubblellaneous:living,tag=!ignore.bubblellaneous,dx=0,limit=1,predicate=bubblellaneous:block/bear_trap] positioned ~-0.875 ~-0.875 ~-0.875 if entity @s[dx=0] run function bubblellaneous:block/bear_trap/catch
tag @s remove --bbln.this
