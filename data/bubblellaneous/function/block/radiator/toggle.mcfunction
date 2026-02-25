setblock ~ ~ ~ air
setblock ~ ~ ~ barrel[facing=up]

scoreboard players add @s bbln.block.timer 1
execute store result score @s bbln.block_state if score @s bbln.block_state matches 0

playsound bubblellaneous:block.lock.register block @a[distance=..16] ~ ~ ~ 0.25 1 0
execute if score @s bbln.block_state matches 0 run return run function bubblellaneous:block_placer/internal/apply_blockstate {name: "default", rotation: 0}
function bubblellaneous:block_placer/internal/apply_blockstate {name: "on", rotation: 0}
