advancement revoke @s only bubblellaneous:event/player/open_container
execute anchored eyes positioned ^ ^ ^2 unless entity @e[type=item_display,tag=--local.uses.gui,distance=..4] run return 0

execute anchored eyes positioned ^ ^ ^2 as @e[type=item_display,tag=--local.name.bubble_bench,limit=1,sort=nearest] at @s if block ~ ~ ~ barrel[open=true] run function bubblellaneous:blocks/bubble_bench/gui/load
