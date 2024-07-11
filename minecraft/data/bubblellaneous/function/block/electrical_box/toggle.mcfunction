scoreboard players add @s local.block_state 1
scoreboard players set @s[scores={local.block_state=2..}] local.block_state 0

execute if score @s local.block_state matches 0 run function bubblellaneous:block/electrical_box/enable
execute if score @s local.block_state matches 1 run function bubblellaneous:block/electrical_box/disable
