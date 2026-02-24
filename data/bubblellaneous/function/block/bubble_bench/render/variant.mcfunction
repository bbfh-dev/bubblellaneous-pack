execute store result score size bbln.tmp store result score max_pages bbln.tmp run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.items
scoreboard players operation max_pages bbln.tmp /= #18 bbln.int
scoreboard players add max_pages bbln.tmp 1
execute if score max_pages bbln.tmp matches ..0 run scoreboard players set max_pages bbln.tmp 1

function bubblellaneous:block/bubble_bench/render/variant/loop
