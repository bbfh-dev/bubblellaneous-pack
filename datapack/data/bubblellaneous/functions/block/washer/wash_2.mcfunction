execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_helmet", Slot:2b}]} run scoreboard players remove @s buln.data0 1
execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_helmet", Slot:2b}]} run data remove block ~ ~ ~ Items[{Slot:2b}].tag.display.color
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_chestplate", Slot:2b}]} run scoreboard players remove @s buln.data0 1
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_chestplate", Slot:2b}]} run data remove block ~ ~ ~ Items[{Slot:2b}].tag.display.color
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_leggings", Slot:2b}]} run scoreboard players remove @s buln.data0 1
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_leggings", Slot:2b}]} run data remove block ~ ~ ~ Items[{Slot:2b}].tag.display.color
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_boots", Slot:2b}]} run scoreboard players remove @s buln.data0 1
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_boots", Slot:2b}]} run data remove block ~ ~ ~ Items[{Slot:2b}].tag.display.color