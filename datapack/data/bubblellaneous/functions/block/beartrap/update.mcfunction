execute unless entity @s[tag=-buln.closed] if entity @p[distance=...9, tag=!-buln.linked, gamemode=!creative, gamemode=!spectator] run function bubblellaneous:block/beartrap/lock
execute if score @s buln.data0 matches 60 run function bubblellaneous:block/beartrap/unlock
execute if score @s buln.data0 matches 1 run tag @s remove -buln.closed
scoreboard players remove @s[scores={buln.data0=1..}] buln.data0 1