tag @s add --local.cached
function bubblellaneous:blocks/curtains/close

scoreboard players set quit local.tmp 0
execute positioned ^1 ^ ^ as @e[type=item_display,tag=--local.name.curtains,tag=!--local.cached,distance=..0.5] at @s run function bubblellaneous:blocks/curtains/close_all

scoreboard players set quit local.tmp 0
execute positioned ^-1 ^ ^ as @e[type=item_display,tag=--local.name.curtains,tag=!--local.cached,distance=..0.5] at @s run function bubblellaneous:blocks/curtains/close_all

scoreboard players set quit local.tmp 0
execute positioned ^ ^1 ^ as @e[type=item_display,tag=--local.name.curtains,tag=!--local.cached,distance=..0.5] at @s run function bubblellaneous:blocks/curtains/close_all

scoreboard players set quit local.tmp 0
execute positioned ^ ^-1 ^ as @e[type=item_display,tag=--local.name.curtains,tag=!--local.cached,distance=..0.5] at @s run function bubblellaneous:blocks/curtains/close_all
