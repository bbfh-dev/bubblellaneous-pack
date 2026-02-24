execute if entity @s[tag=--bbln.camera.spectating] run return run function bubblellaneous:block/surveillance_camera/player/leave {change_gamemode: 1}
execute if entity @s[tag=--bbln.telescope.using] run return run function bubblellaneous:block/telescope/force_leave
