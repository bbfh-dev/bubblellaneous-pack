advancement revoke @s only bubblellaneous:player/event/use_block/hatch
function bubblellaneous:player/event/generic/get_query_entity {type: "interaction", tag: "hatch"}

execute as @e[type=interaction,tag=--local.target_entity] as @e[type=item_display,tag=local.block,distance=..4] if score @s local.block.id = @e[type=interaction,tag=--local.target_entity,limit=1] local.block.id at @s run function bubblellaneous:block/hatch/toggle

function bubblellaneous:player/event/generic/end
