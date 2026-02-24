advancement revoke @s only bubblellaneous:player/event/hit_dummy_player
function bubblellaneous:player/event/get_hurted/main {type: "mannequin", tag: "dummy_player"}

execute as @e[type=minecraft:mannequin,tag=--bbln.target_entity,limit=1,x=0] at @s run function bubblellaneous:utils/dummy_player/on_hit

function bubblellaneous:player/event/generic/end
