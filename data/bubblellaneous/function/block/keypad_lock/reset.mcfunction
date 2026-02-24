data modify entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.pincode set value 0
scoreboard players set @s bbln.block_state 0
function bubblellaneous:block/keypad_lock/update_screen
