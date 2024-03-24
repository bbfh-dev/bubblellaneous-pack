# Spread heat to all nearby pipes (including self)
tag @e[type=item_display,tag=local.name.pipe,distance=..3] add --local.cached

# Continue spreading heat
execute as @e[type=item_display,tag=local.name.pipe,tag=!--local.cached,distance=..5,limit=1,sort=nearest] at @s run function bubblellaneous:block/radiator/internal/radiate_to_pipes

particle dust 0.945 0.537 0.349 1 ~ ~.5 ~ 0.1 0.1 0.1 1 10
function bubblellaneous:block/radiator/melt_surrounding
