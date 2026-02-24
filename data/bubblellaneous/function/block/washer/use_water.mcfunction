playsound minecraft:item.bucket.empty block @a[distance=..16] ~ ~ ~ 0.5 1
execute unless function bubblellaneous:block/washer/remove_1_water run function bubblellaneous:block_placer/internal/apply_blockstate {name: "default", rotation: 0}
