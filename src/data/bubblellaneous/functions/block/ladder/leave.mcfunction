tag @s remove --local.ladder.attached
execute as @e[type=armor_stand,tag=local.keystrokes] if score @s local.player.id = @p local.player.id at @s run function bubblellaneous:block/ladder/attempt_to_land
