execute at @a[tag=--local.camera.spectating] if score @p local.player.id = @s local.player.id as @p run function bubblellaneous:block/surveillance_camera/player/leave {change_gamemode: 1}
kill @s
