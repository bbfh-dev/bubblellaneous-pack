data remove entity @s item.tag.bubblellaneous.block_properties.items
scoreboard players set @s local.block_state 0
scoreboard players operation @s local.gui.page = @s local.gui.previous_page
