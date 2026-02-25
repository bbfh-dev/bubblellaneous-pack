say @s
execute store result score @s bbln.block.id store result score @e[type=#bubblellaneous:entity,tag=--bbln.copy_properties_child] bbln.block.id run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_scores.block_id
execute store result score @s bbln.block.timer run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_scores.block_timer
execute store result score @s bbln.block_state run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_scores.block_state
execute store result score @s bbln.gui.page run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_scores.gui_page
execute store result score @s bbln.gui.previous_page run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_scores.gui_previous_page
data remove entity @s item.components."minecraft:custom_data".bubblellaneous.block_scores

tag @s remove --bbln.copy_properties
tag @e remove --bbln.copy_properties_child
