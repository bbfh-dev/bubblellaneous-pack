data modify storage bubblellaneous tmp.input set value {group: "block"}
execute if data storage bubblellaneous tmp.entry.tag.EntityTag.Item.tag.block_data run data modify storage bubblellaneous tmp.input.name set from storage bubblellaneous tmp.entry.tag.EntityTag.Item.tag.block_data.name
execute if data storage bubblellaneous tmp.entry.tag.item_data run data modify storage bubblellaneous tmp.input.name set from storage bubblellaneous tmp.entry.tag.item_data.name
function bubblellaneous:blocks/bubble_bench/item/blacklist_this with storage bubblellaneous tmp.input
