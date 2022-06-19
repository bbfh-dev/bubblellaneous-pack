summon marker ~ ~ ~ {Tags:["buln.playerStand", "buln.notset"]}
scoreboard players operation @e[type=marker, tag=buln.playerStand, tag=buln.notset, limit=1] buln.data0 = @p buln.data2
tag @e[type=marker, tag=buln.playerStand, tag=buln.notset, limit=1] remove buln.notset

execute unless entity @s[tag=-buln.watching.cctv_camera] run function bubblellaneous:block/cctv_camera/trigger/instance/watch_stand

execute store result score $Player1 bubblellaneous run data get entity @s UUID[0]
execute store result score $Player2 bubblellaneous run data get entity @s UUID[1]
execute store result score $Player3 bubblellaneous run data get entity @s UUID[2]
execute store result score $Player4 bubblellaneous run data get entity @s UUID[3]
scoreboard players set $Temp bubblellaneous 0
execute as @e[type=armor_stand, tag=-buln.update.cctv_camera] run function bubblellaneous:block/cctv_camera/trigger/instance/watch_camera