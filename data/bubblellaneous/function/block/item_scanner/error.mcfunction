function bubblellaneous:block_placer/internal/apply_blockstate {name: "error", rotation: 0}
setblock ~ ~ ~ barrel[facing=up]
playsound minecraft:block.note_block.bass block @a[distance=..16] ~ ~ ~ 0.5 1 0

scoreboard players set @s bbln.block.timer 30
