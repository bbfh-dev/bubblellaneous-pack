execute at @a[tag=--local.camera.spectating] if score @p local.player.id = @s local.player.id as @p run function bubblellaneous:block/surveillance_camera/player/leave {change_gamemode: 1}
execute at @a[tag=--local.telescope.using] if score @p local.player.id = @s local.player.id as @p run function bubblellaneous:block/telescope/force_leave
kill @s
