execute if data storage bubblellaneous tmp.entry.tag.bubblellaneous.is_variant run return run function bubblellaneous:block/bubble_bench/entry/event/click_variant

execute if data storage bubblellaneous tmp.entry.tag.bubblellaneous.is_category run return run function bubblellaneous:block/bubble_bench/entry/event/click_category

scoreboard players set showed_error local.tmp 0
execute if score modifier.shift local.tmp matches 0 run function bubblellaneous:block/bubble_bench/entry/event/click_item_normal
execute if score modifier.shift local.tmp matches 1 run function bubblellaneous:block/bubble_bench/entry/event/click_item_shift
