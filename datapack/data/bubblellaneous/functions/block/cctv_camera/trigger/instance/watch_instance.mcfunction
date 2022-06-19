tag @p add -buln.bestie
gamemode spectator @p[tag=-buln.bestie]
tag @e[type=armor_stand, tag=buln.child] remove -btemp.child
execute at @s as @e[type=armor_stand, tag=buln.child] if score @s buln.registry = @e[type=armor_stand, tag=buln.block, limit=1, sort=nearest] buln.registry run tag @s add -btemp.child
tp @p[tag=-buln.bestie] @e[type=armor_stand, tag=-btemp.child, limit=1]
spectate @e[type=armor_stand, tag=-btemp.child, limit=1] @p[tag=-buln.bestie]
tag @p[tag=-buln.bestie] add -buln.watching.cctv_camera

tag @a remove -buln.bestie