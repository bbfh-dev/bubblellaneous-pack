advancement revoke @s only bubblellaneous:event/player/take_from_shelf

tag @s add --local.player

execute anchored eyes positioned ^ ^ ^2 run tag @e[type=interaction,tag=local.item_holder,distance=..3] add --local.query_entity
function bubblellaneous:utils/event/get_entity_player_looking_at
execute as @e[type=interaction,tag=--local.target_entity] unless score @s local.block.state matches 0 at @s run function bubblellaneous:blocks/type_specific/shelf/take_item

tag @e[type=interaction] remove --local.query_entity
tag @s remove --local.player
