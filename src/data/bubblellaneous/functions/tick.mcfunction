schedule function bubblellaneous:tick 1t replace

execute as @a at @s run function bubblellaneous:player/tick
execute as @e[type=item_frame,tag=local.place,limit=8] at @s align xyz positioned ~.5 ~ ~.5 run function bubblellaneous:utils/block/placer/tick
execute as @e[type=item_display,tag=local.block] at @s run function bubblellaneous:blocks/tick
