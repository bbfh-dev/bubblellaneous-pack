data modify storage bubblellaneous tmp.input set value {group: "block"}
data modify storage bubblellaneous tmp.input.name set from storage bubblellaneous tmp.entry.tag.EntityTag.Item.tag.block_data.name
execute if entity @p[tag=--local.player,gamemode=creative] run function bubblellaneous:blocks/bubble_bench/item/give with storage bubblellaneous tmp.input
execute if entity @p[tag=--local.player,gamemode=!creative] run say CRAFT
