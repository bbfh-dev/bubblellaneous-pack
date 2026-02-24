data modify storage minecraft:bubblellaneous tmp.temp append value {slot:0,item:{}}
data modify storage minecraft:bubblellaneous tmp.temp[-1].slot set from storage minecraft:bubblellaneous tmp.items[-1].Slot
data modify storage minecraft:bubblellaneous tmp.temp[-1].item set from storage minecraft:bubblellaneous tmp.items[-1]

data remove storage minecraft:bubblellaneous tmp.items[-1]
execute if data storage minecraft:bubblellaneous tmp.items[0] run function bubblellaneous:utils/items_to_container
