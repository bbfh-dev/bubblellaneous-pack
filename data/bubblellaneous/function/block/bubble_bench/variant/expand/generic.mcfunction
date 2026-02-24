$data modify storage bubblellaneous tmp.data set from storage bubblellaneous registry.$(category)[{item: "$(group)/$(name)"}]

data modify entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.items set from storage bubblellaneous tmp.data.items
scoreboard players operation @s bbln.gui.previous_page = @s bbln.gui.page
scoreboard players set @s bbln.gui.page 1
scoreboard players set @s bbln.block_state 1

function bubblellaneous:block/bubble_bench/render
