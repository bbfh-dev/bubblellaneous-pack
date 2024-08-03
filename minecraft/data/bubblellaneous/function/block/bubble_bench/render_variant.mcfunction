execute store result score size local.tmp run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.items
function bubblellaneous:block/bubble_bench/render/variant
execute if score i local.tmp < size local.tmp run scoreboard players set bit.1 local.tmp 1

execute if score @s local.block.gui_page matches 32767 run function bubblellaneous:block/bubble_bench/gui/load/variant/go_to_last_page
