scoreboard players reset @s bbln.block.id
tag @s remove --bbln.telescope.using
tag @s add --bbln.camera.leaving
playsound bubblellaneous:block.telescope.exit block @s ~ ~ ~ 0.25 1 0

function bubblellaneous:utils/get_player_entry with entity @s
function bubblellaneous:utils/multidimension_teleport with storage bubblellaneous tmp.entry
scoreboard players operation #id_test bbln.tmp = @s bbln.player.id
execute at @s if entity @e[type=minecraft:mannequin,tag=bbln.dummy_player,predicate=bubblellaneous:check/player.id,limit=1,x=0] run function bubblellaneous:block/surveillance_camera/player/mannequin_sync

execute if data storage bubblellaneous tmp.entry{gamemode: 0} run return run gamemode survival @s
execute if data storage bubblellaneous tmp.entry{gamemode: 1} run return run gamemode creative @s
execute if data storage bubblellaneous tmp.entry{gamemode: 2} run return run gamemode adventure @s
execute if data storage bubblellaneous tmp.entry{gamemode: 3} run return run gamemode spectator @s
