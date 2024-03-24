execute if score @s local.block_state matches 1 run return 0
execute unless entity @p[distance=..2] run return 0
execute if score @s local.block.timer matches 1.. run return 0

tag @s add --local.this
execute positioned ~-0.05 ~-0.05 ~-0.05 as @p[dx=0,dy=0,dz=0] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0,dy=0,dz=0] run function bubblellaneous:block/bear_trap/catch
tag @s remove --local.this
