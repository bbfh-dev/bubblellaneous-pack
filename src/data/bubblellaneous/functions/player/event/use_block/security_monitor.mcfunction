advancement revoke @s only bubblellaneous:player/event/use_block/security_monitor

function bubblellaneous:player/event/generic/get_query_entity {type: "interaction", tag: "security_monitor"}

execute as @e[type=interaction,tag=--local.target_entity] as @e[type=item_display,tag=local.block,distance=..4] if score @s local.block.id = @e[type=interaction,tag=--local.target_entity,limit=1] local.block.id at @s run function bubblellaneous:block/security_monitor/use

function bubblellaneous:player/event/generic/end
