execute as @e[type=armor_stand,tag=local.placeholder] if score @s local.player.id = @p local.player.id run kill @s
tag @s remove --local.disconnecting_from_camera
