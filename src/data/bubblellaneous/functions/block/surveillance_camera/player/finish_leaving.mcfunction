tag @s remove --local.camera.leaving
execute as @e[type=armor_stand,tag=local.dummy_player] if score @s local.player.id = @p local.player.id run kill @s
