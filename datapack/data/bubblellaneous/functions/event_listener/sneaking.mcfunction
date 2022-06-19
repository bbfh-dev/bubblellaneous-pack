advancement revoke @s only bubblellaneous:event/sneaking
scoreboard players reset @s buln.sneaking

execute as @s[tag=-buln.watching.cctv_camera] at @s run function bubblellaneous:block/cctv_camera/leave
execute as @s[tag=!-buln.delay] anchored eyes positioned ^ ^ ^1 if entity @e[tag=-buln.shifted.monitor, distance=..1] as @e[tag=-buln.shifted.monitor, distance=..1, limit=1, sort=nearest] run function bubblellaneous:block/monitor/switch