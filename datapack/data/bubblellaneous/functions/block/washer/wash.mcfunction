execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_helmet", Slot:0b}]} run scoreboard players remove @s buln.data0 1
execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_helmet", Slot:0b}]} run data remove block ~ ~ ~ Items[{Slot:0b}].tag.display.color
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_chestplate", Slot:0b}]} run scoreboard players remove @s buln.data0 1
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_chestplate", Slot:0b}]} run data remove block ~ ~ ~ Items[{Slot:0b}].tag.display.color
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_leggings", Slot:0b}]} run scoreboard players remove @s buln.data0 1
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_leggings", Slot:0b}]} run data remove block ~ ~ ~ Items[{Slot:0b}].tag.display.color
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_boots", Slot:0b}]} run scoreboard players remove @s buln.data0 1
execute if score @s buln.data0 matches 1.. run execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:leather_boots", Slot:0b}]} run data remove block ~ ~ ~ Items[{Slot:0b}].tag.display.color

execute if score @s buln.data0 matches 1.. run function bubblellaneous:block/washer/wash_1
execute if score @s buln.data0 matches 1.. run function bubblellaneous:block/washer/wash_2
execute if score @s buln.data0 matches 1.. run function bubblellaneous:block/washer/wash_3
execute if score @s buln.data0 matches 1.. run function bubblellaneous:block/washer/wash_4