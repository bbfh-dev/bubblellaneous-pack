scoreboard players reset @s local.player.sneak

execute as @s[tag=--local.camera.spectating] run function bubblellaneous:block/surveillance_camera/player/leave {change_gamemode: 1}
