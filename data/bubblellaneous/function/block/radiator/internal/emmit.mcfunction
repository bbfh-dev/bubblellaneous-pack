execute store result score @s bbln.block.timer run random value 100..500
playsound block.fire.extinguish block @a[distance=..16] ~ ~ ~ 0.25 1 0

function bubblellaneous:block/radiator/melt_surrounding
scoreboard players set #pipe_counter bbln.tmp 0
execute as @e[type=item_display,tag=bbln.name.pipe,distance=..1.5,limit=1,sort=nearest] positioned as @s run function bubblellaneous:block/radiator/internal/radiate_to_pipes
scoreboard players reset @e[type=item_display,tag=--bbln.cached,x=0] bbln.block.timer
tag @e[type=item_display,tag=--bbln.cached,x=0] remove --bbln.cached
