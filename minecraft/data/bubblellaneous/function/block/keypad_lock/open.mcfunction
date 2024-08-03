scoreboard players operation id local.tmp = @s local.block.id
execute as @e[type=text_display,tag=local.keypad.screen,distance=..2] if score @s local.block.id = id local.tmp run data modify entity @s text set value '{"text":"OPEN", "color":"green"}'

setblock ~ ~ ~ redstone_block
playsound bubblellaneous:block.lock.unlock block @a ~ ~ ~ 1 1 0

scoreboard players set @s local.block.timer 30
