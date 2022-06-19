data modify entity @s Tags set from entity @e[type=item_frame, tag=-buln.temp, limit=1] Tags
tag @s add buln.block
tag @s remove buln.placer
tag @s remove buln.notset

execute if score $Towards bubblellaneous matches 1 run tag @s add -buln.east
execute if score $Towards bubblellaneous matches 2 run tag @s add -buln.south
execute if score $Towards bubblellaneous matches 3 run tag @s add -buln.west
execute if score $Towards bubblellaneous matches 4 run tag @s add -buln.north

scoreboard players set $Score buln.registry 0
function bubblellaneous:block/abstract/registry
scoreboard players operation @s buln.registry = $Score buln.registry