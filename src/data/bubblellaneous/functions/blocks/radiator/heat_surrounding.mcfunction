scoreboard players set @s local.block.timer 200

function bubblellaneous:blocks/radiator/melt
execute as @e[type=item_display,tag=--local.name.pipe,distance=..1.5,limit=1,sort=nearest] at @s run function bubblellaneous:blocks/radiator/radiate_to_pipes
tag @e[type=item_display] remove --local.cached
