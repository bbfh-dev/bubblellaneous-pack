scoreboard players operation #id_test bbln.tmp = @s bbln.block.id
execute as @e[type=item_display,tag=bbln.camera,predicate=bubblellaneous:check/block.id,limit=1,x=0] at @s run return run function bubblellaneous:block/surveillance_camera/player/spectate
execute if loaded ~ ~ ~ run function bubblellaneous:block/surveillance_camera/player/cancel
