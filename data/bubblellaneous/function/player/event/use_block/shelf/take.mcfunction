advancement revoke @s only bubblellaneous:player/event/use_block/shelf/take
function bubblellaneous:player/event/get_interacted/main {type: "interaction", tag: "shelf"}

execute as @e[type=interaction,tag=--bbln.target_entity,scores={bbln.block_state=1},x=0] at @s run function bubblellaneous:blocks/type_specific/shelf/action/take

function bubblellaneous:player/event/generic/end
