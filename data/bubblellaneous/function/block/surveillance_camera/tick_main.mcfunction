tag @s add --bbln.camera_stand
scoreboard players operation #id_test bbln.tmp = @s bbln.block.id
scoreboard players operation #block_state bbln.tmp = @s bbln.block_state
execute as @e[type=item_display,tag=bbln.camera,predicate=bubblellaneous:check/block.id,limit=1,x=0] at @s run function bubblellaneous:block/surveillance_camera/camera/tick
tag @s remove --bbln.camera_stand
