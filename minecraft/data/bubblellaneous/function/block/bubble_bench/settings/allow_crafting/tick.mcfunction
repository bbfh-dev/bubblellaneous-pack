schedule function bubblellaneous:block/bubble_bench/settings/allow_crafting/tick 1t replace

execute as @e[type=item,nbt={Item: {id: "minecraft:glass_bottle"}}] at @s if block ~ ~-1 ~ crafting_table run function bubblellaneous:block/bubble_bench/settings/allow_crafting/place
