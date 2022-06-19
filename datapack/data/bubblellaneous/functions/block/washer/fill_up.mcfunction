scoreboard players set $Temp bubblellaneous 0
execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:water_bucket", Slot:0b}]} run scoreboard players add $Temp bubblellaneous 1
execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:water_bucket", Slot:0b}]} run item replace block ~ ~ ~ container.0 with bucket
execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:water_bucket", Slot:1b}]} run scoreboard players add $Temp bubblellaneous 1
execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:water_bucket", Slot:1b}]} run item replace block ~ ~ ~ container.1 with bucket
execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:water_bucket", Slot:2b}]} run scoreboard players add $Temp bubblellaneous 1
execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:water_bucket", Slot:2b}]} run item replace block ~ ~ ~ container.2 with bucket
execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:water_bucket", Slot:3b}]} run scoreboard players add $Temp bubblellaneous 1
execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:water_bucket", Slot:3b}]} run item replace block ~ ~ ~ container.3 with bucket
execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:water_bucket", Slot:4b}]} run scoreboard players add $Temp bubblellaneous 1
execute if block ~ ~ ~ hopper{Items:[{id:"minecraft:water_bucket", Slot:4b}]} run item replace block ~ ~ ~ container.4 with bucket
scoreboard players operation $Temp bubblellaneous *= 8 bubblellaneous
scoreboard players operation @s buln.data0 += $Temp bubblellaneous