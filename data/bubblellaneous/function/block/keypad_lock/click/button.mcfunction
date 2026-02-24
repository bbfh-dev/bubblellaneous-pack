execute if score @s bbln.block_state matches 4.. run return 0
scoreboard players add @s bbln.block_state 1

scoreboard players operation #number bbln.tmp = @e[type=interaction,tag=--bbln.target_entity,limit=1,x=0] bbln.block.model

execute store result score #pincode bbln.tmp run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.pincode 10
execute store result entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.pincode int 1 run scoreboard players operation #pincode bbln.tmp += #number bbln.tmp

function bubblellaneous:block/keypad_lock/update_screen
playsound ui.button.click block @a ~ ~ ~ 0.25 1 0
