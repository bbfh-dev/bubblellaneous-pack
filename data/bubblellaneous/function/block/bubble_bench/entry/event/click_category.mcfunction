execute unless data storage bubblellaneous tmp.entry.components.minecraft:custom_data.bubblellaneous.category run return 0
data modify entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.category set from storage bubblellaneous tmp.entry.components.minecraft:custom_data.bubblellaneous.category
scoreboard players set @s bbln.block_state 0
scoreboard players set @s bbln.gui.page 1

function bubblellaneous:block/bubble_bench/render
