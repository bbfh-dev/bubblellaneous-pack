execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_helmet", Slot:4b}]} run scoreboard players remove @s buln.data0 1
execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_helmet", Slot:4b}]} run data remove block ~ ~ ~ Items[{Slot:4b}].tag.display.color
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_chestplate", Slot:4b}]} run scoreboard players remove @s buln.data0 1
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_chestplate", Slot:4b}]} run data remove block ~ ~ ~ Items[{Slot:4b}].tag.display.color
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_leggings", Slot:4b}]} run scoreboard players remove @s buln.data0 1
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_leggings", Slot:4b}]} run data remove block ~ ~ ~ Items[{Slot:4b}].tag.display.color
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_boots", Slot:4b}]} run scoreboard players remove @s buln.data0 1
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_boots", Slot:4b}]} run data remove block ~ ~ ~ Items[{Slot:4b}].tag.display.color