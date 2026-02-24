scoreboard players operation #id_test bbln.tmp = @s bbln.block.id
execute as @e[type=text_display,tag=bbln.keypad.screen,predicate=bubblellaneous:check/block.id,limit=1,x=0] run data modify entity @s text set value {"translate":"ui.bubblellaneous.keypad_lock.open", "color":"green"}

setblock ~ ~ ~ redstone_block
playsound bubblellaneous:block.lock.unlock block @a[distance=..16] ~ ~ ~ 0.25 1 0

scoreboard players set @s bbln.block.timer 30
