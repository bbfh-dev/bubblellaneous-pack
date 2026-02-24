execute if score @s bbln.block.timer matches 1.. run return 0

execute store result score @s bbln.block_state if score @s bbln.block_state matches 0

execute if score @s bbln.block_state matches 0 run function bubblellaneous:block_placer/internal/apply_blockstate {name: "default", rotation: 0}
execute if score @s bbln.block_state matches 1 run function bubblellaneous:block/computer/boot
