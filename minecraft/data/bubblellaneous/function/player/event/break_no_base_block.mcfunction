advancement revoke @s only bubblellaneous:player/event/break_no_base_block
function bubblellaneous:player/event/generic/get_query_entity {type: "interaction", tag: "base"}

execute as @e[type=interaction,tag=--local.target_entity] as @e[type=item_display,tag=local.block,distance=..4] if score @s local.block.id = @e[type=interaction,tag=--local.target_entity,limit=1] local.block.id at @s run function bubblellaneous:blocks/break with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data

function bubblellaneous:player/event/generic/end
