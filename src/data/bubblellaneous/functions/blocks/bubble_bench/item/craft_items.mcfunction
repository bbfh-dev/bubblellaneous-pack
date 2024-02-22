data modify storage bubblellaneous tmp.input set value {group: "item"}
data modify storage bubblellaneous tmp.input.name set from storage bubblellaneous tmp.entry.tag.item_data.name
scoreboard players set limit local.tmp 64
function bubblellaneous:blocks/bubble_bench/item/internal/craft_items
