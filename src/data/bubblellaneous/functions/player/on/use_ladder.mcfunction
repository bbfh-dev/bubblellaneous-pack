advancement revoke @s only bubblellaneous:event/player/use_ladder

tag @s add --local.player

execute anchored eyes positioned ^ ^ ^2 run tag @e[type=interaction,tag=local.ladder,distance=..3] add --local.query_entity
function bubblellaneous:utils/event/get_entity_player_looking_at
execute as @e[type=interaction,tag=--local.target_entity] at @s run function bubblellaneous:blocks/ladder/use

tag @e[type=interaction] remove --local.query_entity
tag @s remove --local.player
tag @s add --local.using_ladder
execute unless score using_ladder local.status matches 1 run function bubblellaneous:status/using_ladder/load
