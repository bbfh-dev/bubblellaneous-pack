scoreboard players set quit local.tmp 0
execute if score @s local.block.state matches 0 run function bubblellaneous:blocks/curtains/close_all
execute if score @s local.block.state matches 1 run function bubblellaneous:blocks/curtains/open_all
tag @e[type=item_display] remove --local.cached
