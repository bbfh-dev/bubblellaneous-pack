execute unless block ~ ~ ~ redstone_lamp[lit=true] run return 0
execute if score @s local.block.timer matches 1.. run return 0

function bubblellaneous:block/alarm_block/trigger
