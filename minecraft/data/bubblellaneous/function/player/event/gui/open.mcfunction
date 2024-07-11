advancement revoke @s only bubblellaneous:player/event/gui/open

tag @s add --local.event_player
execute anchored eyes positioned ^ ^ ^2 unless entity @e[type=item_display,tag=--local.uses.gui,distance=..4] run return 0

execute anchored eyes positioned ^ ^ ^2 as @e[type=item_display,tag=local.name.bubble_bench,limit=1,sort=nearest] at @s if block ~ ~ ~ barrel[open=true] run function bubblellaneous:block/bubble_bench/render
execute anchored eyes positioned ^ ^ ^2 as @e[type=item_display,tag=local.name.radiator,limit=1,sort=nearest] at @s if block ~ ~ ~ barrel[open=true] run function bubblellaneous:block/radiator/toggle
execute anchored eyes positioned ^ ^ ^2 as @e[type=item_display,tag=local.name.retina_scanner,limit=1,sort=nearest] at @s if block ~ ~ ~ barrel[open=true] run function bubblellaneous:block/retina_scanner/use
execute anchored eyes positioned ^ ^ ^2 as @e[type=item_display,tag=local.name.item_scanner,limit=1,sort=nearest] at @s if block ~ ~ ~ barrel[open=true] run function bubblellaneous:block/item_scanner/use
tag @s remove --local.event_player
