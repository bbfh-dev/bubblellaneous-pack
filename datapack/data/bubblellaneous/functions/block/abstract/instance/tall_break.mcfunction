scoreboard players set $TempBreak bubblellaneous 1
function bubblellaneous:block/abstract/destroy
execute if entity @s[tag=-buln.base.container] positioned ~ ~1 ~ if block ~ ~ ~ barrel run setblock ~ ~ ~ air destroy
execute if entity @s[tag=-buln.base.middle] positioned ~ ~1 ~ if block ~ ~ ~ petrified_oak_slab run setblock ~ ~ ~ air