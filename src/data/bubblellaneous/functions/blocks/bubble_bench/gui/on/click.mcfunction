function bubblellaneous:blocks/bubble_bench/gui/load

execute store result storage bubblellaneous tmp.input.at int 1 run scoreboard players get slot local.tmp
function bubblellaneous:blocks/bubble_bench/gui/entry/get_by_index with storage bubblellaneous tmp.input

# Ignore empty slots
execute if data storage bubblellaneous tmp.entry.tag{CustomModelData: 370000} run return 0
execute if data storage bubblellaneous tmp.entry.tag{CustomModelData: 370001} run return 0

execute if data storage bubblellaneous tmp.entry{id: "minecraft:structure_void"} run function bubblellaneous:blocks/bubble_bench/gui/on/click/ui
execute if data storage bubblellaneous tmp.entry{id: "minecraft:item_frame"} run function bubblellaneous:blocks/bubble_bench/gui/on/click/item
