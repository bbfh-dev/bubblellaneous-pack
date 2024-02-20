advancement revoke @s only bubblellaneous:event/player/break_baseless_block

tag @s add --local.player

execute anchored eyes positioned ^ ^ ^2 run tag @e[type=interaction,tag=--local.base,distance=..3] add --local.query_entity
function bubblellaneous:utils/event/get_entity_player_looking_at
execute as @e[type=interaction,tag=--local.target_entity] as @e[type=item_display,tag=local.block] if score @s local.block.id = @e[type=interaction,tag=--local.target_entity,limit=1] local.block.id at @s run function bubblellaneous:blocks/break with entity @s item.tag.block_data

tag @e[type=interaction] remove --local.query_entity
tag @s remove --local.player
