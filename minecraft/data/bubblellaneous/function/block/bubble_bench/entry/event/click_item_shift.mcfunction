execute if data storage bubblellaneous tmp.entry.tag.EntityTag.Item.components.minecraft:custom_data.bubblellaneous.block_data run function bubblellaneous:block/bubble_bench/entry/craft_block
execute if data storage bubblellaneous tmp.entry.components.minecraft:custom_data.bubblellaneous.item_data run function bubblellaneous:block/bubble_bench/entry/craft_item

scoreboard players set amount local.tmp 64
function bubblellaneous:block/bubble_bench/item/shift_click
