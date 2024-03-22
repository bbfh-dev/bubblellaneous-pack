execute if score @s local.block_state matches 4.. run return 0
scoreboard players add @s local.block_state 1

scoreboard players operation number local.tmp = @e[type=interaction,tag=--local.target_entity,limit=1] local.block.model

execute store result score pincode local.tmp run data get entity @s item.tag.bubblellaneous.block_properties.pincode
scoreboard players operation pincode local.tmp *= 10 local.int
execute store result entity @s item.tag.bubblellaneous.block_properties.pincode int 1 run scoreboard players operation pincode local.tmp += number local.tmp

function bubblellaneous:block/keypad_lock/update_screen
playsound ui.button.click block @a ~ ~ ~ 1 1 0
