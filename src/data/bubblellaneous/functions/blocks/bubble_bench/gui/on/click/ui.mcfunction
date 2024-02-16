execute if data storage bubblellaneous tmp.entry.tag{CustomModelData: 370003} run return 0
execute if data storage bubblellaneous tmp.entry.tag{CustomModelData: 370005} run return 0

execute if data storage bubblellaneous tmp.entry.tag.bubblellaneous{action: "close_variant"} run function bubblellaneous:blocks/bubble_bench/item/internal/reset_items
execute if data storage bubblellaneous tmp.entry.tag.bubblellaneous{action: "previous_page"} run scoreboard players remove @s local.block.gui_page 1
execute if data storage bubblellaneous tmp.entry.tag.bubblellaneous{action: "next_page"} run scoreboard players add @s local.block.gui_page 1

function bubblellaneous:blocks/bubble_bench/gui/load
