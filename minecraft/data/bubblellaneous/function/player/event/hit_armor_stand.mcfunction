advancement revoke @s only bubblellaneous:player/event/hit_armor_stand
function bubblellaneous:player/event/generic/get_query_entity {type: "interaction", tag: "armor_stand"}

execute as @e[type=interaction,tag=--local.target_entity] at @s run function bubblellaneous:utils/dummy_player/on_hit

function bubblellaneous:player/event/generic/end
