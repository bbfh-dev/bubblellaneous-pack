execute store result score #UUID0 bubblellaneous run data get entity @s RootVehicle.Entity.UUID[0]
execute store result score #UUID1 bubblellaneous run data get entity @s RootVehicle.Entity.UUID[1]
execute store result score #UUID2 bubblellaneous run data get entity @s RootVehicle.Entity.UUID[2]
execute store result score #UUID3 bubblellaneous run data get entity @s RootVehicle.Entity.UUID[3]
scoreboard players set #Success bubblellaneous 0
execute as @e[type=minecraft:pig, tag=bubblellaneous] run function bubblellaneous:player/v1.2a/player_holding_stick_instance
execute if score #Success bubblellaneous matches 1 at @s run tp @s ~ ~.015 ~ ~ ~