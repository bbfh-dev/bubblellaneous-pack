advancement revoke @s only bubblellaneous:player/event/gui/open

tag @s add --bbln.event_player
execute anchored eyes positioned ^ ^ ^32 as @e[type=item_display,tag=--bbln.uses.gui,distance=..32,predicate=bubblellaneous:block/gui_interact] positioned as @s run function bubblellaneous:player/event/gui/case
tag @s remove --bbln.event_player
