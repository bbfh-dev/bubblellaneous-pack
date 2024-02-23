advancement revoke @s only bubblellaneous:event/player/use_curtains

tag @s add --local.player

execute rotated ~ 0 positioned ^ ^ ^1 run tag @e[type=interaction,tag=local.curtains,distance=..5] add --local.query_entity
function bubblellaneous:utils/event/get_entity_player_looking_at
execute as @e[type=interaction,tag=--local.target_entity] as @e[type=item_display,tag=local.block,distance=..4] if score @s local.block.id = @e[type=interaction,tag=--local.target_entity,limit=1] local.block.id at @s run function bubblellaneous:blocks/curtains/use

tag @e[type=interaction] remove --local.query_entity
tag @s remove --local.player
