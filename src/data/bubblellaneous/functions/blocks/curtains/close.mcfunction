scoreboard players set @s local.block.state 0

execute positioned ~ ~1 ~ if entity @e[type=item_display,tag=--local.name.curtains,distance=..0.5] run function bubblellaneous:blocks/curtains/blockstate/set_bottom {rotate: 0}
execute if score quit local.tmp matches 1 run return 0

function bubblellaneous:blocks/curtains/blockstate/set_top {rotate: 0}
