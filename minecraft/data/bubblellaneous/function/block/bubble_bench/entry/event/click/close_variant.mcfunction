data remove entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.items
scoreboard players set @s local.block_state 0
scoreboard players operation @s local.gui.page = @s local.gui.previous_page
