advancement revoke @s only bubblellaneous:player/event/use_block/seat
function bubblellaneous:player/event/get_interacted/main {type: "interaction", tag: "seat"}

scoreboard players operation #id_test bbln.tmp = @e[type=interaction,tag=--bbln.target_entity,limit=1,x=0] bbln.block.id
execute as @e[type=interaction,tag=--bbln.target_entity,limit=1,x=0] at @e[type=item_display,tag=bbln.block,predicate=bubblellaneous:check/block.id,limit=1,x=0] run function bubblellaneous:blocks/type_specific/seat/action/sit with entity @e[type=item_display,tag=bbln.block,predicate=bubblellaneous:check/block.id,limit=1,x=0] item.components."minecraft:custom_data".bubblellaneous.block_data

function bubblellaneous:player/event/generic/end
