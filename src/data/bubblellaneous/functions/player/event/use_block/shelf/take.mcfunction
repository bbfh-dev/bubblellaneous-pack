advancement revoke @s only bubblellaneous:player/event/use_block/shelf/take

function bubblellaneous:player/event/generic/get_query_entity {type: "interaction", tag: "shelf"}

execute as @e[type=interaction,tag=--local.target_entity,scores={local.block_state=1}] at @s run function bubblellaneous:block/type_specific/shelf/action/take

function bubblellaneous:player/event/generic/end
