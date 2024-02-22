scoreboard players remove @s local.block.timer 1
execute if score @s local.block.timer matches ..0 run function bubblellaneous:blocks/radiator/heat_surrounding
