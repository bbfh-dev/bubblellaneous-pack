say @s
execute store result score @s local.block.id store result score @e[type=#bubblellaneous:entity,tag=--local.copy_properties_child] local.block.id run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_scores.block_id
execute store result score @s local.block.model run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_scores.block_model
execute store result score @s local.block.timer run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_scores.block_timer
execute store result score @s local.block_state run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_scores.block_state
execute store result score @s local.gui.page run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_scores.gui_page
execute store result score @s local.gui.previous_page run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_scores.gui_previous_page
data remove entity @s item.components."minecraft:custom_data".bubblellaneous.block_scores

tag @s remove --local.copy_properties
tag @e remove --local.copy_properties_child
