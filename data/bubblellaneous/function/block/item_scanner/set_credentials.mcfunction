scoreboard players set @s bbln.block_state 1
data modify entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.lock_item.id set from entity @a[tag=--bbln.event_player,limit=1,x=0] SelectedItem.id
data modify entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.lock_item.components set from entity @a[tag=--bbln.event_player,limit=1,x=0] SelectedItem.components
