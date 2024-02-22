function bubblellaneous:blocks/bubble_bench/gui/load

function bubblellaneous:blocks/bubble_bench/gui/on/click/get_entry

# Ignore empty slots
execute if data storage bubblellaneous tmp.entry.tag{CustomModelData: 370000} run return 0
execute if data storage bubblellaneous tmp.entry.tag{CustomModelData: 370001} run return 0

execute if data storage bubblellaneous tmp.entry{id: "minecraft:structure_void"} run function bubblellaneous:blocks/bubble_bench/gui/on/click/ui
execute unless data storage bubblellaneous tmp.entry{id: "minecraft:structure_void"} run function bubblellaneous:blocks/bubble_bench/gui/on/click/item
