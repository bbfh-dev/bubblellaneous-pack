scoreboard players set @s bbln.block_state 16
function bubblellaneous:block_placer/internal/apply_blockstate {name: "full", rotation: 0}
playsound minecraft:item.bucket.fill block @a[distance=..16] ~ ~ ~ 0.5 1
setblock ~ ~0.5 ~ air
