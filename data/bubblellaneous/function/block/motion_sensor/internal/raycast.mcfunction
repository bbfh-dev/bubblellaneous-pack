execute unless block ~ ~ ~ #bubblellaneous:no_solid_collision run return run scoreboard players set #has_obsticle bbln.tmp 1

execute if entity @e[type=item_display,tag=--bbln.this,limit=1,distance=..0.5] run return 0

scoreboard players remove #limit bbln.tmp 1
execute if score #limit bbln.tmp matches 1.. positioned ^ ^ ^0.5 run function bubblellaneous:block/motion_sensor/internal/raycast
