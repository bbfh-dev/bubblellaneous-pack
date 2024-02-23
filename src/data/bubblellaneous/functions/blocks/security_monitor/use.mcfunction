execute if score @s local.block.model matches 1 run tellraw @p[tag=--local.player] {"translate":"ui.bubblellaneous.camera.disconnected", "color":"red"}
execute if score @s local.block.model matches 2 run tellraw @p[tag=--local.player] {"translate":"ui.bubblellaneous.camera.disabled", "color":"red"}
execute unless score @s local.block.model matches 0 run playsound block.note_block.bass block @a ~ ~ ~ 1 1 0
execute unless score @s local.block.model matches 0 run return 0

execute at @p[tag=--local.player] summon armor_stand run function bubblellaneous:blocks/security_monitor/spectate/setup_placeholder
function bubblellaneous:blocks/security_monitor/spectate/load with entity @s item.tag.block_properties.link
tag @p[tag=--local.player] add --local.spectating
