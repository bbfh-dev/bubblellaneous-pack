scoreboard players set @s local.block.state 1

execute positioned ~ ~1 ~ unless entity @e[type=item_display,tag=--local.name.curtains,distance=..0.5] positioned ^1 ^-1 ^ if entity @e[type=item_display,tag=--local.name.curtains,distance=..0.5] positioned ^-2 ^ ^ if entity @e[type=item_display,tag=--local.name.curtains,distance=..0.5] run function bubblellaneous:blocks/curtains/blockstate/set_middle {rotate: 0}
execute if score quit local.tmp matches 1 run return 0

execute positioned ~ ~1 ~ if entity @e[type=item_display,tag=--local.name.curtains,distance=..0.5] positioned ^1 ^-1 ^ if entity @e[type=item_display,tag=--local.name.curtains,distance=..0.5] positioned ^-2 ^ ^ if entity @e[type=item_display,tag=--local.name.curtains,distance=..0.5] run function bubblellaneous:blocks/curtains/blockstate/set_empty {rotate: 0}
execute if score quit local.tmp matches 1 run return 0

execute positioned ~ ~1 ~ if entity @e[type=item_display,tag=--local.name.curtains,distance=..0.5] positioned ^-1 ^-1 ^ if entity @e[type=item_display,tag=--local.name.curtains,distance=..0.5] run function bubblellaneous:blocks/curtains/blockstate/set_bottom_right {rotate: 0}
execute if score quit local.tmp matches 1 run return 0

execute positioned ~ ~1 ~ if entity @e[type=item_display,tag=--local.name.curtains,distance=..0.5] run function bubblellaneous:blocks/curtains/blockstate/set_bottom_left {rotate: 0}
execute if score quit local.tmp matches 1 run return 0

execute positioned ^-1 ^ ^ if entity @e[type=item_display,tag=--local.name.curtains,distance=..0.5] run function bubblellaneous:blocks/curtains/blockstate/set_top_right {rotate: 0}
execute if score quit local.tmp matches 1 run return 0

function bubblellaneous:blocks/curtains/blockstate/set_top_left {rotate: 0}
