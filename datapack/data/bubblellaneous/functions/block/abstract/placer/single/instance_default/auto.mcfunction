execute if block ~ ~1 ~ #bubblellaneous:air run setblock ~ ~ ~ petrified_oak_slab[type=top]
execute unless block ~ ~1 ~ #bubblellaneous:air if block ~ ~-1 ~ #bubblellaneous:air run setblock ~ ~ ~ petrified_oak_slab[type=bottom]
execute unless block ~ ~1 ~ #bubblellaneous:air unless block ~ ~-1 ~ #bubblellaneous:air run setblock ~ ~ ~ structure_void