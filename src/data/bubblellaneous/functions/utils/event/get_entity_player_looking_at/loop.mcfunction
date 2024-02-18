execute as @e[tag=--local.query_entity,distance=..0.5,limit=1,sort=nearest] run function bubblellaneous:utils/event/get_entity_player_looking_at/found

scoreboard players remove limit local.tmp 1
execute if score limit local.tmp matches 1.. positioned ^ ^ ^.1 run function bubblellaneous:utils/event/get_entity_player_looking_at/loop
