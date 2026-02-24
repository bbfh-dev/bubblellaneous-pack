scoreboard players set @s bbln.gui.page 1

data modify entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.lock set from storage bubblellaneous tmp.code
playsound bubblellaneous:block.lock.register block @a[distance=..16] ~ ~ ~ 0.25 1 0
