tag @e[type=item_display,tag=local.block,distance=..32] add --local.is_queued

execute if score @s local.on_leave_game matches 1.. run function bubblellaneous:player/on/leave
execute if score @s local.on_right_click matches 1.. run function bubblellaneous:player/on/right_click
execute if score @s local.on_sneak matches 1.. run function bubblellaneous:player/on/sneak

#region GUI
execute if score @s local.on_drop matches 1.. run function bubblellaneous:player/on/drop_item

execute if entity @e[type=item_display,tag=--local.name.bubble_bench,distance=..5] run function bubblellaneous:player/while_in_gui
#endregion

scoreboard players remove @s[scores={local.player.sound=0..}] local.player.sound 1
execute if score @s local.player.sound matches 0 run function bubblellaneous:player/sound/play

#region Security cameras
execute as @s[tag=--local.connecting_to_camera,tag=!--local.delaying_connection] if loaded ~ ~ ~ run function bubblellaneous:player/cameras/delay_connect
execute as @s[tag=--local.disconnecting_from_camera] if loaded ~ ~ ~ run function bubblellaneous:player/cameras/disconnect
#endregion
