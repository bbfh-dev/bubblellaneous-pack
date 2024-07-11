scoreboard players set @s local.block_state 1

execute positioned ~ ~1 ~ unless entity @e[type=item_display,tag=local.name.curtains,distance=..0.5] positioned ^1 ^-1 ^ if entity @e[type=item_display,tag=local.name.curtains,distance=..0.5] positioned ^-2 ^ ^ if entity @e[type=item_display,tag=local.name.curtains,distance=..0.5] run return run function bubblellaneous:block/curtains/blockstates/apply/middle {rotation: 0}
execute positioned ~ ~1 ~ if entity @e[type=item_display,tag=local.name.curtains,distance=..0.5] positioned ^1 ^-1 ^ if entity @e[type=item_display,tag=local.name.curtains,distance=..0.5] positioned ^-2 ^ ^ if entity @e[type=item_display,tag=local.name.curtains,distance=..0.5] run return run function bubblellaneous:block/curtains/blockstates/apply/empty {rotation: 0}
execute positioned ~ ~1 ~ if entity @e[type=item_display,tag=local.name.curtains,distance=..0.5] positioned ^-1 ^-1 ^ if entity @e[type=item_display,tag=local.name.curtains,distance=..0.5] run return run function bubblellaneous:block/curtains/blockstates/apply/bottom_right {rotation: 0}
execute positioned ~ ~1 ~ if entity @e[type=item_display,tag=local.name.curtains,distance=..0.5] run return run function bubblellaneous:block/curtains/blockstates/apply/bottom_left {rotation: 0}
execute positioned ^-1 ^ ^ if entity @e[type=item_display,tag=local.name.curtains,distance=..0.5] run return run function bubblellaneous:block/curtains/blockstates/apply/top_right {rotation: 0}

function bubblellaneous:block/curtains/blockstates/apply/top_left {rotation: 0}
