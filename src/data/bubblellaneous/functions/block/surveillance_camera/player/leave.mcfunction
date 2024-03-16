scoreboard players reset @s local.block.id
tag @s remove --local.camera.spectating
tag @s add --local.camera.leaving

function bubblellaneous:block/surveillance_camera/internal/get_player_entry with entity @s
function bubblellaneous:utils/multidimension_teleport_with_rot with storage bubblellaneous tmp.entry
execute if data storage bubblellaneous tmp.entry{gamemode: 0} run gamemode survival @s
execute if data storage bubblellaneous tmp.entry{gamemode: 1} run gamemode creative @s
execute if data storage bubblellaneous tmp.entry{gamemode: 2} run gamemode adventure @s
execute if data storage bubblellaneous tmp.entry{gamemode: 3} run gamemode spectator @s
