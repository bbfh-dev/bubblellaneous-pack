scoreboard players add @s bbln.block.timer 1
execute store result score @s bbln.block_state if score @s bbln.block_state matches 0

playsound bubblellaneous:block.lock.register block @a[distance=..16] ~ ~ ~ 0.25 1 0
execute if score @s bbln.block_state matches 0 run return run function ./turn_off
    function bubblellaneous:block_placer/internal/apply_blockstate {name: "default", rotation: 0}
    setblock ~ ~ ~ petrified_oak_slab[type=double]

function bubblellaneous:block_placer/internal/apply_blockstate {name: "on", rotation: 0}
# We put in the items so that hoppers can't access the block
setblock ~ ~ ~ furnace[lit=true]{Items:[{count:1, Slot:1b, id:"minecraft:wooden_shovel"}, {count:1, Slot: 0b, id:"minecraft:wooden_shovel"}]}
