execute store result score @s local.block.timer run random value 100..500
playsound block.fire.extinguish block @a ~ ~ ~ 1 1 0

function bubblellaneous:block/radiator/melt_surrounding
execute as @e[type=item_display,tag=local.name.pipe,distance=..1.5,limit=1,sort=nearest] at @s run function bubblellaneous:block/radiator/internal/radiate_to_pipes
tag @e[type=item_display] remove --local.cached
