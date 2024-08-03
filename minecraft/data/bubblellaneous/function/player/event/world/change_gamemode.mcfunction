scoreboard players operation @s local.player.gamemode = gamemode local.tmp
execute if score @s local.player.gamemode matches 3 run return 0

execute as @s[tag=--local.camera.spectating] run function bubblellaneous:block/surveillance_camera/player/leave {change_gamemode: 0}
