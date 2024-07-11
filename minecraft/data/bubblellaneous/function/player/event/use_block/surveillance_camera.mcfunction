advancement revoke @s only bubblellaneous:player/event/use_block/surveillance_camera

function bubblellaneous:player/event/generic/get_query_entity {type: "interaction", tag: "base.surveillance_camera"}

execute as @e[type=interaction,tag=--local.target_entity] as @e[type=item_display,tag=local.block,distance=..4] if score @s local.block.id = @e[type=interaction,tag=--local.target_entity,limit=1] local.block.id at @s run function bubblellaneous:block/surveillance_camera/interact

function bubblellaneous:player/event/generic/end
