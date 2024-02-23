tag @s remove --local.connecting_to_camera
tag @s remove --local.delaying_connection
effect clear @s resistance
effect clear @s fire_resistance
effect clear @s slow_falling

tag @s add --local.player
scoreboard players set success local.tmp 0
execute as @e[type=cave_spider,tag=local.camera_mount_point,distance=..5,limit=1,sort=nearest] at @s run function bubblellaneous:blocks/security_monitor/spectate/connect
execute if score success local.tmp matches 0 run function bubblellaneous:player/cameras/cancel
tag @s remove --local.player
