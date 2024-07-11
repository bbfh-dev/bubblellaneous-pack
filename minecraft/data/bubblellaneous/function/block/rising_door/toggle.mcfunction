execute store result score state local.tmp run scoreboard players get @s local.block_state
execute if score @s local.block.timer matches 1.. run return 0

execute if score state local.tmp matches 0 run function bubblellaneous:block/rising_door/open
execute if score state local.tmp matches 1 run function bubblellaneous:block/rising_door/close
scoreboard players set is_playing local.tmp 0
