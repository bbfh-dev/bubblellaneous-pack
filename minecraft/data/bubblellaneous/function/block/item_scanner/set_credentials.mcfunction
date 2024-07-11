scoreboard players set @s local.block_state 1
data modify entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.lock_item.id set from entity @p[tag=--local.event_player] SelectedItem.id
data modify entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.lock_item.tag set from entity @p[tag=--local.event_player] SelectedItem.tag
