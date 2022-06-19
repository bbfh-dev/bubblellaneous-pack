execute store result score $Facing bubblellaneous run data get entity @s Facing
execute if score $Facing bubblellaneous matches 5 run scoreboard players set $Towards bubblellaneous 1
execute if score $Facing bubblellaneous matches 3 run scoreboard players set $Towards bubblellaneous 2
execute if score $Facing bubblellaneous matches 4 run scoreboard players set $Towards bubblellaneous 3
execute if score $Facing bubblellaneous matches 2 run scoreboard players set $Towards bubblellaneous 4
execute if score $Facing bubblellaneous matches 0..1 run scoreboard players set $Towards bubblellaneous 0
execute if score $Towards bubblellaneous matches 1 at @s if block ~-1 ~ ~ #bubblellaneous:wall_predicate run scoreboard players set $Towards bubblellaneous 0
execute if score $Towards bubblellaneous matches 2 at @s if block ~ ~ ~-1 #bubblellaneous:wall_predicate run scoreboard players set $Towards bubblellaneous 0
execute if score $Towards bubblellaneous matches 3 at @s if block ~1 ~ ~ #bubblellaneous:wall_predicate run scoreboard players set $Towards bubblellaneous 0
execute if score $Towards bubblellaneous matches 4 at @s if block ~ ~ ~1 #bubblellaneous:wall_predicate run scoreboard players set $Towards bubblellaneous 0