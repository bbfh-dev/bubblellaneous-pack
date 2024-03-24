execute store result score battery local.tmp run data get entity @s SelectedItem.tag.bubblellaneous.item_properties.battery
execute store result score max_battery local.tmp run data get entity @s SelectedItem.tag.bubblellaneous.item_properties.max_charge
execute if score battery local.tmp matches ..0 run return run function bubblellaneous:item/flashlight/internal/error_no_battery

#region Drain battery
execute store result storage bubblellaneous tmp.battery int 1 run scoreboard players remove battery local.tmp 1
item modify entity @s weapon.mainhand bubblellaneous:flashlight/drain_battery
#endregion

scoreboard players set limit local.tmp 64
scoreboard players set did_succeed local.tmp 0
function bubblellaneous:item/flashlight/internal/raycast
execute if score did_succeed local.tmp matches 0 positioned ^ ^ ^32 run function bubblellaneous:item/flashlight/internal/backtrace
