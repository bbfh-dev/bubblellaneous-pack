execute as @e[type=minecraft:item,tag=!--bbln.item,distance=..2] if items entity @s contents minecraft:pointed_dripstone if data entity @s {Age: 1s} run kill @s
return fail
