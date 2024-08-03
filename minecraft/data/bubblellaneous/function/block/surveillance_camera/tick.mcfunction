tag @s add --local.camera_stand
execute unless score @s local.block.timer matches 1.. as @e[type=item_display,tag=local.camera,limit=1,sort=nearest] at @s run function bubblellaneous:block/surveillance_camera/camera/tick
tag @s remove --local.camera_stand
