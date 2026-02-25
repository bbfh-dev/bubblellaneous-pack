execute store result score @s bbln.block_state if score @s bbln.block_state matches 0
execute if score @s bbln.block_state matches 0 run return run function bubblellaneous:block_placer/internal/apply_blockstate {name: "default", rotation: 0}
function bubblellaneous:block_placer/internal/apply_blockstate {name: "activated", rotation: 0}
