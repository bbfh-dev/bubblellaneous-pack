execute as @s[tag=-buln.east] positioned ~ ~ ~1 if block ~ ~ ~ oak_trapdoor run setblock ~ ~ ~ air
execute as @s[tag=-buln.south] positioned ~-1 ~ ~ if block ~ ~ ~ oak_trapdoor run setblock ~ ~ ~ air
execute as @s[tag=-buln.west] positioned ~ ~ ~-1 if block ~ ~ ~ oak_trapdoor run setblock ~ ~ ~ air
execute as @s[tag=-buln.north] positioned ~1 ~ ~ if block ~ ~ ~ oak_trapdoor run setblock ~ ~ ~ air
function bubblellaneous:block/abstract/destroy