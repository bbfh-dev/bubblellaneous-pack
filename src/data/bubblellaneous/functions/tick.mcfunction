schedule function bubblellaneous:tick 1t replace

execute as @e[type=item_frame,tag=local.place,limit=8] at @s run function bubblellaneous:placer/tick
execute as @a at @s run function bubblellaneous:player/tick
execute as @e[type=item_display,tag=local.block] at @s run function bubblellaneous:block/tick
