execute unless block ~ ~ ~ #bubblellaneous:no_solid_collision run return run scoreboard players set has_obsticle local.tmp 1

execute if entity @e[type=item_display,tag=--local.this,distance=..0.5] run return 0

scoreboard players remove limit local.tmp 1
execute if score limit local.tmp matches 1.. positioned ^ ^ ^0.5 run function bubblellaneous:block/motion_sensor/internal/raycast
