advancement revoke @s only bubblellaneous:player/event/use_block/surveillance_camera/turn_right

scoreboard players operation #id_test bbln.tmp = @s bbln.block.id
execute as @e[type=item_display,tag=bbln.name.surveillance_camera,predicate=bubblellaneous:check/block.id,limit=1,x=0] at @s \
    unless score @s bbln.var matches 1 run scoreboard players set @s bbln.var 1

execute as @e[type=item_display,tag=bbln.camera,predicate=bubblellaneous:check/block.id,limit=1,x=0] at @s run function ./spin
    execute store result score #should_stop bbln.tmp run function bubblellaneous:block/surveillance_camera/camera/spin/should_stop_clockwise
    execute if score #should_stop bbln.tmp matches 0 run rotate @s ~1 ~

