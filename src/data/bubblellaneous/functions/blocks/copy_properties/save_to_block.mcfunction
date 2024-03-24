execute store result entity @s item.tag.bubblellaneous.block_scores.block_id int 1 run scoreboard players get @s local.block.id
execute store result entity @s item.tag.bubblellaneous.block_scores.block_model int 1 run scoreboard players get @s local.block.model
execute store result entity @s item.tag.bubblellaneous.block_scores.block_timer int 1 run scoreboard players get @s local.block.timer
execute store result entity @s item.tag.bubblellaneous.block_scores.block_state int 1 run scoreboard players get @s local.block_state
execute store result entity @s item.tag.bubblellaneous.block_scores.gui_page int 1 run scoreboard players get @s local.gui.page
execute store result entity @s item.tag.bubblellaneous.block_scores.gui_previous_page int 1 run scoreboard players get @s local.gui.previous_page
scoreboard players operation this local.tmp = @s local.block.id
execute as @e[type=#bubblellaneous:entity,distance=..3] if score @s local.block.id = this local.tmp run tag @s add --local.copy_properties_child
