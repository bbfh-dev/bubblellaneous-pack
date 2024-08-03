execute unless block ^ ^ ^1 #bubblellaneous:no_solid_collision run return run function bubblellaneous:item/flashlight/internal/backtrace

scoreboard players remove limit local.tmp 1
execute if score limit local.tmp matches 1.. positioned ^ ^ ^0.5 run function bubblellaneous:item/flashlight/internal/raycast
