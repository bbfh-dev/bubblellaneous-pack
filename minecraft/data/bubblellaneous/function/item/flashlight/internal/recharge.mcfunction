execute store result storage bubblellaneous tmp.battery int 1 run data get entity @s SelectedItem.components.minecraft:custom_data.bubblellaneous.item_properties.max_charge
item modify entity @s weapon.mainhand bubblellaneous:flashlight/drain_battery
playsound ui.loom.take_result block @s ~ ~ ~ 1 1 0
