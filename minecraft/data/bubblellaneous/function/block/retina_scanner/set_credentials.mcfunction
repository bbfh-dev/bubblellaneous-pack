scoreboard players set @s local.block_state 1

function bubblellaneous:block/retina_scanner/get_uuid
data modify entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.owner_uuid set from storage bubblellaneous tmp.uuid
playsound bubblellaneous:block.lock.register block @a ~ ~ ~ 1 1 0
