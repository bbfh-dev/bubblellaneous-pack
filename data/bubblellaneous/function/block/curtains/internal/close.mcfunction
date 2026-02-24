scoreboard players set @s bbln.block_state 0

execute positioned ~ ~1 ~ if entity @e[type=item_display,tag=bbln.name.curtains,distance=..0.5,limit=1] run return run function bubblellaneous:block_placer/internal/apply_blockstate {name: "bottom_closed", rotation: 0}

function bubblellaneous:block_placer/internal/apply_blockstate {name: "default", rotation: 0}
