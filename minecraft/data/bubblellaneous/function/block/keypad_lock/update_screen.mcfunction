scoreboard players operation id local.tmp = @s local.block.id
execute store result score pincode local.tmp run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.pincode

execute if score @s local.block_state matches 0 as @e[type=text_display,tag=local.keypad.screen,distance=..2] if score @s local.block.id = id local.tmp run data modify entity @s text set value '{"text":"××××", "color":"gray"}'

execute if score @s local.block_state matches 1 as @e[type=text_display,tag=local.keypad.screen,distance=..2] if score @s local.block.id = id local.tmp run data modify entity @s text set value '["", {"text":"×××", "color":"gray"}, {"score":{"name":"pincode", "objective":"local.tmp"}}]'

execute if score @s local.block_state matches 2 as @e[type=text_display,tag=local.keypad.screen,distance=..2] if score @s local.block.id = id local.tmp if score pincode local.tmp matches 10.. run data modify entity @s text set value '["", {"text":"××", "color":"gray"}, {"score":{"name":"pincode", "objective":"local.tmp"}}]'
execute if score @s local.block_state matches 2 as @e[type=text_display,tag=local.keypad.screen,distance=..2] if score @s local.block.id = id local.tmp unless score pincode local.tmp matches 10.. run data modify entity @s text set value '["", {"text":"××", "color":"gray"}, "0", {"score":{"name":"pincode", "objective":"local.tmp"}}]'

execute if score @s local.block_state matches 3 as @e[type=text_display,tag=local.keypad.screen,distance=..2] if score @s local.block.id = id local.tmp if score pincode local.tmp matches 100.. run data modify entity @s text set value '["", {"text":"×", "color":"gray"}, {"score":{"name":"pincode", "objective":"local.tmp"}}]'
execute if score @s local.block_state matches 3 as @e[type=text_display,tag=local.keypad.screen,distance=..2] if score @s local.block.id = id local.tmp if score pincode local.tmp matches ..9 run data modify entity @s text set value '["", {"text":"×", "color":"gray"}, "00", {"score":{"name":"pincode", "objective":"local.tmp"}}]'
execute if score @s local.block_state matches 3 as @e[type=text_display,tag=local.keypad.screen,distance=..2] if score @s local.block.id = id local.tmp if score pincode local.tmp matches 10..99 run data modify entity @s text set value '["", {"text":"×", "color":"gray"}, "0", {"score":{"name":"pincode", "objective":"local.tmp"}}]'

execute if score @s local.block_state matches 4 as @e[type=text_display,tag=local.keypad.screen,distance=..2] if score @s local.block.id = id local.tmp if score pincode local.tmp matches 1000.. run data modify entity @s text set value '[{"score":{"name":"pincode", "objective":"local.tmp"}}]'
execute if score @s local.block_state matches 4 as @e[type=text_display,tag=local.keypad.screen,distance=..2] if score @s local.block.id = id local.tmp if score pincode local.tmp matches 100..999 run data modify entity @s text set value '["0", {"score":{"name":"pincode", "objective":"local.tmp"}}]'
execute if score @s local.block_state matches 4 as @e[type=text_display,tag=local.keypad.screen,distance=..2] if score @s local.block.id = id local.tmp if score pincode local.tmp matches 10..99 run data modify entity @s text set value '["00", {"score":{"name":"pincode", "objective":"local.tmp"}}]'
execute if score @s local.block_state matches 4 as @e[type=text_display,tag=local.keypad.screen,distance=..2] if score @s local.block.id = id local.tmp if score pincode local.tmp matches ..9 run data modify entity @s text set value '["000", {"score":{"name":"pincode", "objective":"local.tmp"}}]'
