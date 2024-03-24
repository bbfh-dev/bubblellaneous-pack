scoreboard players remove @s[scores={local.block.timer=0..}] local.block.timer 1
execute if score @s local.block.timer matches 0 run function bubblellaneous:blocks/uses/timer/fire
