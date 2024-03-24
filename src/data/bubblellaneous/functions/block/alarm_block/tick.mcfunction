execute unless block ~ ~ ~ redstone_lamp[lit=true] run return 0
execute if score @s local.block.timer matches 1.. run return 0

scoreboard players set @s local.block.timer 201
function bubblellaneous:block/alarm_block/trigger
