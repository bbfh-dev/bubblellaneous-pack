execute as @e[tag=buln.child] if score @s buln.registry = @e[type=armor_stand, tag=buln.block, limit=1, sort=nearest] buln.registry run kill @s
scoreboard players set $Updated bubblellaneous 1