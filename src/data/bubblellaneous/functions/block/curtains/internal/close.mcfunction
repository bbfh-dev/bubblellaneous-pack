scoreboard players set @s local.block_state 0

execute positioned ~ ~1 ~ if entity @e[type=item_display,tag=local.name.curtains,distance=..0.5] run return run function bubblellaneous:block/curtains/blockstates/apply/bottom_closed {rotation: 0}

function bubblellaneous:block/curtains/blockstates/apply/top_closed {rotation: 0}
