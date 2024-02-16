$execute if score @s local.block.state matches 0 run data modify entity @s item.tag.items set from storage bubblellaneous bench_registry.furniture[$(index)].items
$execute if score @s local.block.state matches 1 run data modify entity @s item.tag.items set from storage bubblellaneous bench_registry.technology[$(index)].items
$execute if score @s local.block.state matches 2 run data modify entity @s item.tag.items set from storage bubblellaneous bench_registry.food[$(index)].items
$execute if score @s local.block.state matches 3 run data modify entity @s item.tag.items set from storage bubblellaneous bench_registry.miscellaneous[$(index)].items
scoreboard players set @s local.block.gui_page 1
