scoreboard players set $TempBreak bubblellaneous 0
execute if entity @s[tag=-buln.base.container] unless block ~ ~ ~ barrel run function bubblellaneous:block/abstract/instance/tall_break
execute unless score $TempBreak bubblellaneous matches 1 if entity @s[tag=-buln.base.container] positioned ~ ~1 ~ unless block ~ ~ ~ barrel run function bubblellaneous:block/abstract/instance/tall_destroy

execute if entity @s[tag=-buln.base.middle] unless block ~ ~ ~ petrified_oak_slab run scoreboard players set $TempBreak bubblellaneous 1
execute if entity @s[tag=-buln.base.middle] unless block ~ ~ ~ petrified_oak_slab run function bubblellaneous:block/abstract/instance/tall_break
execute unless score $TempBreak bubblellaneous matches 1 if entity @s[tag=-buln.base.middle] positioned ~ ~1 ~ unless block ~ ~ ~ petrified_oak_slab run function bubblellaneous:block/abstract/instance/tall_destroy