execute unless data entity @s RootVehicle at @s run function bubblellaneous:status/using_ladder/stop

tag @s remove --local.is_climbing
execute store result score x local.tmp run data get entity @s Motion[0] 1000
execute store result score z local.tmp run data get entity @s Motion[2] 1000
scoreboard players set proceed local.tmp 1
execute if score x local.tmp matches 0 if score z local.tmp matches 0 run scoreboard players set proceed local.tmp 0
execute if score proceed local.tmp matches 1 run function bubblellaneous:status/using_ladder/read_keystrokes
