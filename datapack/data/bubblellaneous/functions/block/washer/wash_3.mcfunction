execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_helmet", Slot:3b}]} run scoreboard players remove @s buln.data0 1
execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_helmet", Slot:3b}]} run data remove block ~ ~ ~ Items[{Slot:3b}].tag.display.color
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_chestplate", Slot:3b}]} run scoreboard players remove @s buln.data0 1
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_chestplate", Slot:3b}]} run data remove block ~ ~ ~ Items[{Slot:3b}].tag.display.color
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_leggings", Slot:3b}]} run scoreboard players remove @s buln.data0 1
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_leggings", Slot:3b}]} run data remove block ~ ~ ~ Items[{Slot:3b}].tag.display.color
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_boots", Slot:3b}]} run scoreboard players remove @s buln.data0 1
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_boots", Slot:3b}]} run data remove block ~ ~ ~ Items[{Slot:3b}].tag.display.color