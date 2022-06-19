advancement revoke @s only bubblellaneous:event/block/beartrap
tag @e[type=armor_stand] remove -btemp.block
execute as @e[type=armor_stand, tag=-buln.update.beartrap] if score @s buln.registry = @p buln.data1 run tag @s add -btemp.block
execute at @e[type=armor_stand, tag=-btemp.block] run tp @s ~ ~ ~