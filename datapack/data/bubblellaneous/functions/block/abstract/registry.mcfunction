scoreboard players add $Score buln.registry 1
execute as @e[type=minecraft:armor_stand, tag=buln.block] if score @s buln.registry = $Score buln.registry run function bubblellaneous:block/abstract/registry