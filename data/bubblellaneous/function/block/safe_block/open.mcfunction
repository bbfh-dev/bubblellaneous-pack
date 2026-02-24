function bubblellaneous:block/safe_block/open_silent with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data
function bubblellaneous:block_placer/internal/apply_blockstate {name: "open", rotation: 0}
playsound bubblellaneous:block.safe_block.open block @a[distance=..16] ~ ~ ~ 0.5 1 0

scoreboard players set @s bbln.block_state 1
