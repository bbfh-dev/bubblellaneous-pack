tag @s remove --local.using_ladder
tag @s add --local.passenger
execute as @e[type=armor_stand,tag=local.keystrokes] if score @s local.player.id = @p local.player.id at @s run function bubblellaneous:status/using_ladder/leave
tag @s remove --local.passenger

scoreboard players reset using_ladder local.status
schedule clear bubblellaneous:status/using_ladder/tick
