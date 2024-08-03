scoreboard players operation id local.tmp = @s local.block.id
execute as @e[type=text_display,tag=local.keypad.screen,distance=..2] if score @s local.block.id = id local.tmp run data modify entity @s text set value '{"text":"∅∅∅", "color":"red"}'

playsound minecraft:block.note_block.bass block @a ~ ~ ~ 1 1 0

scoreboard players set @s local.block.timer 30
