# Credit: https://www.youtube.com/watch?v=mMmeay6uXXE
execute positioned ~-0.05 ~-0.05 ~-0.05 as @e[tag=--local.query_entity,dx=0,dy=0,dz=0] positioned ~-0.9 ~-0.9 ~-0.9 if entity @s[dx=0,dy=0,dz=0] run function bubblellaneous:utils/event/get_entity_player_looking_at/found

scoreboard players remove limit local.tmp 1
execute if score limit local.tmp matches 1.. positioned ^ ^ ^.1 run function bubblellaneous:utils/event/get_entity_player_looking_at/loop
