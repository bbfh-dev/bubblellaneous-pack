$setblock ~ ~ ~ barrel[facing=up]{CustomName: $(display_name)}
data modify block ~ ~ ~ Items set from entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.items
scoreboard players set @s bbln.block.timer 30
