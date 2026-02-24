item replace entity @s contents from entity @a[tag=--bbln.event_player,limit=1,x=0] weapon.mainhand

data modify entity @s item.components."minecraft:entity_data".Item.components.minecraft:custom_data.bubblellaneous.block_properties.camera set from storage minecraft:bubblellaneous tmp.in

item replace entity @a[tag=--bbln.event_player,limit=1,x=0] weapon.mainhand from entity @s contents
kill @s
