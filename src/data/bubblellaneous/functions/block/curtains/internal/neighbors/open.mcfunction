tag @s add --local.cached
function bubblellaneous:block/curtains/internal/open

execute positioned ^1 ^ ^ as @e[type=item_display,tag=local.name.curtains,tag=!--local.cached,distance=..0.5] at @s run function bubblellaneous:block/curtains/internal/neighbors/open
execute positioned ^-1 ^ ^ as @e[type=item_display,tag=local.name.curtains,tag=!--local.cached,distance=..0.5] at @s run function bubblellaneous:block/curtains/internal/neighbors/open
execute positioned ^ ^1 ^ as @e[type=item_display,tag=local.name.curtains,tag=!--local.cached,distance=..0.5] at @s run function bubblellaneous:block/curtains/internal/neighbors/open
execute positioned ^ ^-1 ^ as @e[type=item_display,tag=local.name.curtains,tag=!--local.cached,distance=..0.5] at @s run function bubblellaneous:block/curtains/internal/neighbors/open
