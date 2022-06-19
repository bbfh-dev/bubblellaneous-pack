tp @s ~ ~ ~ facing entity @p feet

execute store result score $Rotation bubblellaneous run data get entity @s Rotation[0]

# EAST
execute if score $Rotation bubblellaneous matches 225..315 run scoreboard players set $Towards bubblellaneous 1
execute if score $Rotation bubblellaneous matches -135..-45 run scoreboard players set $Towards bubblellaneous 1

# SOUTH
execute if score $Rotation bubblellaneous matches -45..45 run scoreboard players set $Towards bubblellaneous 2
execute if score $Rotation bubblellaneous matches -360..-315 run scoreboard players set $Towards bubblellaneous 2

# WEST
execute if score $Rotation bubblellaneous matches 45..135 run scoreboard players set $Towards bubblellaneous 3
execute if score $Rotation bubblellaneous matches -315..-225 run scoreboard players set $Towards bubblellaneous 3

# NORTH
execute if score $Rotation bubblellaneous matches 135..225 run scoreboard players set $Towards bubblellaneous 4
execute if score $Rotation bubblellaneous matches -225..-135 run scoreboard players set $Towards bubblellaneous 4