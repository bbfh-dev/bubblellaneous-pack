execute if score @s bbln.block.timer matches 1.. run return 0

scoreboard players set #sound bbln.tmp 1
execute if score @s bbln.block_state matches 0 run return run function bubblellaneous:block/rising_door/open
function bubblellaneous:block/rising_door/close
