execute if entity @s[tag=-buln.towards.player] run function bubblellaneous:block/abstract/placer/towards/player
execute if score $Towards bubblellaneous matches 1 if block ~ ~ ~-1 minecraft:air run function bubblellaneous:block/abstract/placer/wide/instance
execute if score $Towards bubblellaneous matches 1 unless block ~ ~ ~-1 minecraft:air run function bubblellaneous:loot/return
execute if score $Towards bubblellaneous matches 2 if block ~1 ~ ~ minecraft:air run function bubblellaneous:block/abstract/placer/wide/instance
execute if score $Towards bubblellaneous matches 2 unless block ~1 ~ ~ minecraft:air run function bubblellaneous:loot/return
execute if score $Towards bubblellaneous matches 3 if block ~ ~ ~1 minecraft:air run function bubblellaneous:block/abstract/placer/wide/instance
execute if score $Towards bubblellaneous matches 3 unless block ~ ~ ~1 minecraft:air run function bubblellaneous:loot/return
execute if score $Towards bubblellaneous matches 4 if block ~-1 ~ ~ minecraft:air run function bubblellaneous:block/abstract/placer/wide/instance
execute if score $Towards bubblellaneous matches 4 unless block ~-1 ~ ~ minecraft:air run function bubblellaneous:loot/return