data remove entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.items
scoreboard players set @s bbln.block_state 0
scoreboard players operation @s bbln.gui.page = @s bbln.gui.previous_page
