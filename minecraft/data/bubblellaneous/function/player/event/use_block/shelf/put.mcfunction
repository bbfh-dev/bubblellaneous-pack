advancement revoke @s only bubblellaneous:player/event/use_block/shelf/put

function bubblellaneous:player/event/generic/get_query_entity {type: "interaction", tag: "shelf"}

execute as @e[type=interaction,tag=--local.target_entity,scores={local.block_state=0}] at @s run function bubblellaneous:blocks/type_specific/shelf/action/put

function bubblellaneous:player/event/generic/end
