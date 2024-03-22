execute if score @s local.block.timer matches 1.. run return 0

scoreboard players add @s local.block_state 1
execute if score @s local.block_state matches 2.. run scoreboard players set @s local.block_state 0

execute if score @s local.block_state matches 0 run function bubblellaneous:block/computer/blockstates/apply/default {rotation: 0}
execute if score @s local.block_state matches 1 run function bubblellaneous:block/computer/boot
