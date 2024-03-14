execute store result score size local.tmp store result score max_pages local.tmp run data get entity @s item.tag.bubblellaneous.block_properties.items
scoreboard players operation max_pages local.tmp /= 18 local.int
scoreboard players add max_pages local.tmp 1
execute if score max_pages local.tmp matches ..0 run scoreboard players set max_pages local.tmp 1

function bubblellaneous:block/bubble_bench/render/variant/loop
