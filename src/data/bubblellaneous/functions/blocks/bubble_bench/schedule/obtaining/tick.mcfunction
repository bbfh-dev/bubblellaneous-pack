schedule function bubblellaneous:blocks/bubble_bench/schedule/obtaining/tick 1t replace

execute as @e[type=item,nbt={Item: {id: "minecraft:glass_bottle"}}] at @s if block ~ ~-1 ~ crafting_table run function bubblellaneous:blocks/bubble_bench/schedule/obtaining/place
