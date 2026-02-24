execute store result score size bbln.tmp run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.items
function bubblellaneous:block/bubble_bench/render/variant
execute if score i bbln.tmp < size bbln.tmp run scoreboard players set bit.1 bbln.tmp 1

execute if score @s bbln.block.gui_page matches 32767 run function bubblellaneous:block/bubble_bench/gui/load/variant/go_to_last_page
