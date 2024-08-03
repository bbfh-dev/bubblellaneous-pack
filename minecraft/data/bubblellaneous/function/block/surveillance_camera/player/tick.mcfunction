scoreboard players set is_spectating local.tmp 0
execute as @e[type=item_display,tag=local.camera] if score @s local.block.id = @p local.block.id at @s run function bubblellaneous:block/surveillance_camera/player/spectate
execute if score is_spectating local.tmp matches 0 if loaded ~ ~ ~ run function bubblellaneous:block/surveillance_camera/player/cancel
