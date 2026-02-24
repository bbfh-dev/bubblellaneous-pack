scoreboard players set @s bbln.block_state 1

data modify entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.owner_uuid set from storage bubblellaneous tmp.uuid
playsound bubblellaneous:block.lock.register block @a[distance=..16] ~ ~ ~ 0.25 1 0
