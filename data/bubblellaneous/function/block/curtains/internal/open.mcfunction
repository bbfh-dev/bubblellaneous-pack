scoreboard players set @s bbln.block_state 1

execute positioned ~ ~1 ~ if entity @e[type=item_display,tag=bbln.name.curtains,distance=..0.5,limit=1] positioned ~ ~-1 ~ run return run function bubblellaneous:block/curtains/internal/open_is_bottom
execute positioned ^1 ^-1 ^ if entity @e[type=item_display,tag=bbln.name.curtains,distance=..0.5,limit=1] positioned ^-2 ^ ^ if entity @e[type=item_display,tag=bbln.name.curtains,distance=..0.5,limit=1] run return run function bubblellaneous:block_placer/internal/apply_blockstate {name: "middle", rotation: 0}
execute positioned ^-1 ^ ^ if entity @e[type=item_display,tag=bbln.name.curtains,distance=..0.5,limit=1] run return run function bubblellaneous:block_placer/internal/apply_blockstate {name: "top_right", rotation: 0}
function bubblellaneous:block_placer/internal/apply_blockstate {name: "top_left", rotation: 0}

