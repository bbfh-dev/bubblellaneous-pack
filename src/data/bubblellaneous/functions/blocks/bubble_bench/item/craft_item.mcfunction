data modify storage bubblellaneous tmp.input set value {group: "item"}
data modify storage bubblellaneous tmp.input.name set from storage bubblellaneous tmp.entry.tag.item_data.name
execute if entity @p[tag=--local.player,gamemode=creative] run function bubblellaneous:blocks/bubble_bench/item/give with storage bubblellaneous tmp.input
execute if entity @p[tag=--local.player,gamemode=!creative] run function bubblellaneous:blocks/bubble_bench/item/craft with storage bubblellaneous tmp.input
