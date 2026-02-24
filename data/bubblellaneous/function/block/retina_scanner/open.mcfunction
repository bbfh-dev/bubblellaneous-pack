function bubblellaneous:block_placer/internal/apply_blockstate {name: "open", rotation: 0}
setblock ~ ~ ~ redstone_block
playsound bubblellaneous:block.lock.unlock block @a[distance=..16] ~ ~ ~ 0.25 1 0

scoreboard players set @s bbln.block.timer 30
