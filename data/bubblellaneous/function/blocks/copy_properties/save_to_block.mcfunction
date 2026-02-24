execute store result entity @s item.components."minecraft:custom_data".bubblellaneous.block_scores.block_id int 1 run scoreboard players get @s bbln.block.id
execute store result entity @s item.components."minecraft:custom_data".bubblellaneous.block_scores.block_model int 1 run scoreboard players get @s bbln.block.model
execute store result entity @s item.components."minecraft:custom_data".bubblellaneous.block_scores.block_timer int 1 run scoreboard players get @s bbln.block.timer
execute store result entity @s item.components."minecraft:custom_data".bubblellaneous.block_scores.block_state int 1 run scoreboard players get @s bbln.block_state
execute store result entity @s item.components."minecraft:custom_data".bubblellaneous.block_scores.gui_page int 1 run scoreboard players get @s bbln.gui.page
execute store result entity @s item.components."minecraft:custom_data".bubblellaneous.block_scores.gui_previous_page int 1 run scoreboard players get @s bbln.gui.previous_page
tag @s add --bbln.copy_properties
scoreboard players operation #id_test bbln.tmp = @s bbln.block.id
execute as @e[type=#bubblellaneous:entity,predicate=bubblellaneous:check/block.id,distance=..3] run tag @s add --bbln.copy_properties_child
