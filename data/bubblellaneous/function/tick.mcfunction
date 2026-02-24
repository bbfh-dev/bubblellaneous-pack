# warn-off-file target-selector-no-dimension
schedule function bubblellaneous:tick 1t replace

execute as @e[type=marker,tag=bbln.light] at @s run function bubblellaneous:blocks/light/remove
execute as @e[type=item_frame,tag=bbln.place,limit=8] at @s run function bubblellaneous:block_placer/tick
execute as @a at @s run function bubblellaneous:player/tick
execute as @e[type=item_display,tag=bbln.block] at @s run function bubblellaneous:blocks/tick
execute as @e[type=minecraft:mannequin,tag=bbln.dummy_player,tag=--bbln.loaded] at @s run function bubblellaneous:utils/dummy_player/tick_m
execute as @e[type=item,tag=!--bbln.item] run function bubblellaneous:utils/dropped_item/tick
