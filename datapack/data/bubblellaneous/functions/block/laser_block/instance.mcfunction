scoreboard players set $Temp bubblellaneous 0
scoreboard players set $Limit bubblellaneous 5
function bubblellaneous:block/laser_block/loop
execute unless score @s buln.data0 = $Temp bubblellaneous at @s run function bubblellaneous:block/laser_block/switch