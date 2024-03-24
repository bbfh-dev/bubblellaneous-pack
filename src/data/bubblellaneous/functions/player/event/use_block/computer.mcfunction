advancement revoke @s only bubblellaneous:player/event/use_block/computer
function bubblellaneous:player/event/generic/get_query_entity {type: "interaction", tag: "base.computer"}

execute as @e[type=interaction,tag=--local.target_entity] as @e[type=item_display,tag=local.block,distance=..4] if score @s local.block.id = @e[type=interaction,tag=--local.target_entity,limit=1] local.block.id at @s run function bubblellaneous:block/computer/use

function bubblellaneous:player/event/generic/end
