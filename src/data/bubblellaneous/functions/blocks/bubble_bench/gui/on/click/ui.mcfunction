execute if data storage bubblellaneous tmp.entry.tag{CustomModelData: 370003} run return 0
execute if data storage bubblellaneous tmp.entry.tag{CustomModelData: 370005} run return 0

execute if data storage bubblellaneous tmp.entry.tag.bubblellaneous{action: "close_variant"} run function bubblellaneous:blocks/bubble_bench/item/internal/reset_items
execute if score modifier.shift local.tmp matches 0 run function bubblellaneous:blocks/bubble_bench/gui/on/click/ui_normal
execute if score modifier.shift local.tmp matches 1 run function bubblellaneous:blocks/bubble_bench/gui/on/click/ui_shift

function bubblellaneous:blocks/bubble_bench/gui/load
