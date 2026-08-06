advancement revoke @s only bubblellaneous:player/event/use_block/surveillance_camera/turn_left

scoreboard players operation #id_test bbln.tmp = @s bbln.block.id
execute as @e[type=item_display,tag=bbln.name.surveillance_camera,predicate=bubblellaneous:check/block.id,limit=1,x=0] \
    unless score @s bbln.var matches 1 run function ./toggle
    scoreboard players set @s bbln.var 1
    playsound minecraft:ui.button.click master @p ~ ~ ~ 1 1 0

execute as @e[type=item_display,tag=bbln.camera,predicate=bubblellaneous:check/block.id,limit=1,x=0] at @s run function ./spin
    execute store result score #should_stop bbln.tmp run function bubblellaneous:block/surveillance_camera/camera/spin/should_stop_counter_clockwise
    execute if score #should_stop bbln.tmp matches 0 run rotate @s ~-1 ~
