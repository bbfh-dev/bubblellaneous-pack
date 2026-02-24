tag @s add --bbln.cached
function bubblellaneous:block/curtains/internal/close

execute positioned ^1 ^ ^ as @e[type=item_display,tag=bbln.name.curtains,tag=!--bbln.cached,distance=..0.5,limit=1] at @s run function bubblellaneous:block/curtains/internal/neighbors/close_main
execute positioned ^-1 ^ ^ as @e[type=item_display,tag=bbln.name.curtains,tag=!--bbln.cached,distance=..0.5,limit=1] at @s run function bubblellaneous:block/curtains/internal/neighbors/close_main
execute positioned ^ ^1 ^ as @e[type=item_display,tag=bbln.name.curtains,tag=!--bbln.cached,distance=..0.5,limit=1] at @s run function bubblellaneous:block/curtains/internal/neighbors/close_main
execute positioned ^ ^-1 ^ as @e[type=item_display,tag=bbln.name.curtains,tag=!--bbln.cached,distance=..0.5,limit=1] at @s run function bubblellaneous:block/curtains/internal/neighbors/close_main
