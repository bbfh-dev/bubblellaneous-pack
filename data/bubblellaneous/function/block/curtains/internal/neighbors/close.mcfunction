execute positioned ~ ~1 ~ if entity @e[type=item_display,tag=bbln.name.curtains,distance=..0.5,limit=1] run return run function bubblellaneous:block/curtains/internal/neighbors/close

execute as @e[type=item_display,tag=bbln.name.curtains,distance=..0.5,limit=1] run function bubblellaneous:block/curtains/internal/neighbors/close_main
