scoreboard players set @s local.gui.page 1

data modify entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.lock set from storage bubblellaneous tmp.code
playsound bubblellaneous:block.lock.register block @a ~ ~ ~ 1 1 0
