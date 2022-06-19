advancement revoke @s only bubblellaneous:event/sit_on_a_chair/spin
tag @s add buln.temp
execute as @e[type=pig, tag=-buln.spin, limit=1, sort=nearest] at @s rotated as @p[tag=buln.temp] run tp @s ~ ~ ~ ~ ~
tag @s remove buln.temp