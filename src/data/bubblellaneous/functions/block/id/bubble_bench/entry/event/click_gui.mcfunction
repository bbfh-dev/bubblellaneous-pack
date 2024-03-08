execute if data storage bubblellaneous tmp.entry.tag{CustomModelData: 370003} run return 0
execute if data storage bubblellaneous tmp.entry.tag{CustomModelData: 370005} run return 0

execute if data storage bubblellaneous tmp.entry.tag.bubblellaneous{action: "close_variant"} run function bubblellaneous:block/id/bubble_bench/entry/event/click/close_variant
execute if score modifier.shift local.tmp matches 0 run function bubblellaneous:block/id/bubble_bench/entry/event/click_gui_normal
execute if score modifier.shift local.tmp matches 1 run function bubblellaneous:block/id/bubble_bench/entry/event/click_gui_shift

function bubblellaneous:block/id/bubble_bench/render
