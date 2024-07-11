execute unless data storage bubblellaneous tmp.entry.tag.bubblellaneous.category run return 0
data modify entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.category set from storage bubblellaneous tmp.entry.tag.bubblellaneous.category
scoreboard players set @s local.block_state 0
scoreboard players set @s local.gui.page 1

function bubblellaneous:block/bubble_bench/render
