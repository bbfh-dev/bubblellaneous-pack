tag @e[type=item_display,tag=local.block,distance=..16] add --local.is_queued

execute if score @s local.on_leave_game matches 1.. run function bubblellaneous:player/on/leave

#region GUI
execute if score @s local.on_drop matches 1.. run function bubblellaneous:player/on/drop_item

execute store success score has_gui_items local.tmp run clear @s #bubblellaneous:gui_item{bubblellaneous: {is_gui: 1b}} 0
execute if score has_gui_items local.tmp matches 1 run function bubblellaneous:player/on/click_gui_item
#endregion

scoreboard players remove @s[scores={local.player.sound=0..}] local.player.sound 1
execute if score @s local.player.sound matches 0 run function bubblellaneous:player/sound/play
