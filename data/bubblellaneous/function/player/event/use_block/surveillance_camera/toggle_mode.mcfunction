advancement revoke @s only bubblellaneous:player/event/use_block/surveillance_camera/toggle_mode
scoreboard players set @s bbln.player.interaction_cooldown 5

scoreboard players operation #id_test bbln.tmp = @s bbln.block.id
execute as @e[type=item_display,tag=bbln.name.surveillance_camera,predicate=bubblellaneous:check/block.id,limit=1,x=0] at @s \
    run function bubblellaneous:block/surveillance_camera/camera/toggle_mode
playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1 0
