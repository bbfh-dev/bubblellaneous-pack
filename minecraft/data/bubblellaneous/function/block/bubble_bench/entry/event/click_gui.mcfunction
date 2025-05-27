execute if data storage bubblellaneous tmp.entry.components{"minecraft:item_model": "bubblellaneous:ui_arrow_left_inactive"} run return 0
execute if data storage bubblellaneous tmp.entry.components{"minecraft:item_model": "bubblellaneous:ui_arrow_right_inactive"} run return 0

execute if data storage bubblellaneous tmp.entry.components."minecraft:custom_data".bubblellaneous{action: "close_variant"} run function bubblellaneous:block/bubble_bench/entry/event/click/close_variant
execute if score modifier.shift local.tmp matches 0 run function bubblellaneous:block/bubble_bench/entry/event/click_gui_normal
execute if score modifier.shift local.tmp matches 1 run function bubblellaneous:block/bubble_bench/entry/event/click_gui_shift

function bubblellaneous:block/bubble_bench/render
