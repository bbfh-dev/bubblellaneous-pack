advancement revoke @s only bubblellaneous:event/player/use_padlock_door

tag @s add --local.player

execute anchored eyes positioned ^ ^ ^2 run tag @e[type=interaction,tag=local.padlock,distance=..4] add --local.query_entity
function bubblellaneous:utils/event/get_entity_player_looking_at
execute as @e[type=interaction,tag=--local.target_entity] as @e[type=item_display,tag=local.block,distance=..4] if score @s local.block.id = @e[type=interaction,tag=--local.target_entity,limit=1] local.block.id at @s run function bubblellaneous:blocks/padlock_block/use

tag @e[type=interaction] remove --local.query_entity
tag @s remove --local.player
