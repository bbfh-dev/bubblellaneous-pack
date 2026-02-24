advancement revoke @s only bubblellaneous:player/event/use_block/call_bell
function bubblellaneous:player/event/get_interacted/main {type: "interaction", tag: "call_bell"}

scoreboard players operation #id_test bbln.tmp = @e[type=interaction,tag=--bbln.target_entity,limit=1,x=0] bbln.block.id
execute as @e[type=item_display,tag=bbln.block,predicate=bubblellaneous:check/block.id,limit=1,x=0] at @s run function bubblellaneous:block/call_bell/ring

function bubblellaneous:player/event/generic/end
