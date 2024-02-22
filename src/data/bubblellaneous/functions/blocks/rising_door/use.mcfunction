execute store result score state local.tmp run scoreboard players get @s local.block.state

execute if score state local.tmp matches 0 run function bubblellaneous:blocks/rising_door/open
execute if score state local.tmp matches 1 run function bubblellaneous:blocks/rising_door/close
scoreboard players set is_playing local.tmp 0
