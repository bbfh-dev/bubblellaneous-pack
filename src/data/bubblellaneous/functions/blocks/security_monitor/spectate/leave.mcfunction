function bubblellaneous:utils/function/set_silent
execute as @e[type=cave_spider,tag=local.camera_mount_point] if score @s local.player.id = @p[tag=--local.spectating] local.player.id run scoreboard players reset @s local.player.id
tag @s remove --local.spectating

execute store result storage bubblellaneous tmp.input.id int 1 run scoreboard players get @s local.player.id
function bubblellaneous:player/database/get_entry with storage bubblellaneous tmp.input

#region Restore gamemode
execute if data storage bubblellaneous tmp.entry.properties.location{gamemode: 0} run gamemode survival @s
execute if data storage bubblellaneous tmp.entry.properties.location{gamemode: 1} run gamemode creative @s
execute if data storage bubblellaneous tmp.entry.properties.location{gamemode: 2} run gamemode adventure @s
execute if data storage bubblellaneous tmp.entry.properties.location{gamemode: 3} run gamemode spectator @s
#endregion

function bubblellaneous:blocks/security_monitor/spectate/teleport_back with storage bubblellaneous tmp.entry.properties.location
effect give @s blindness 1 0 true
execute at @s run playsound entity.horse.armor block @s ~ ~ ~ 1 1 0
