execute store result score @s bbln.player.gamemode run data get entity @s playerGameType
#scoreboard players operation @s bbln.player.gamemode = gamemode bbln.tmp
execute if score @s bbln.player.gamemode matches 3 run return 0

execute if entity @s[tag=--bbln.camera.spectating] run function bubblellaneous:block/surveillance_camera/player/leave {change_gamemode: 0}
