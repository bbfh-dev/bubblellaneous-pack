execute if data storage bubblellaneous tmp.entry.tag.bubblellaneous.is_variant run function bubblellaneous:blocks/bubble_bench/gui/on/click/variant
execute if data storage bubblellaneous tmp.entry.tag.bubblellaneous.is_variant run return 0

execute if data storage bubblellaneous tmp.entry.tag.bubblellaneous.is_icon run function bubblellaneous:blocks/bubble_bench/gui/on/click/icon
execute if data storage bubblellaneous tmp.entry.tag.bubblellaneous.is_icon run return 0

scoreboard players set showed_error local.tmp 0
execute if score modifier.shift local.tmp matches 0 run function bubblellaneous:blocks/bubble_bench/gui/on/click/items_normal
execute if score modifier.shift local.tmp matches 1 run function bubblellaneous:blocks/bubble_bench/gui/on/click/items_shift
