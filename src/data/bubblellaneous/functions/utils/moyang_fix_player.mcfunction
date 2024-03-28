tag @s add --local.player
execute as @e[type=item_display,tag=local.name.telescope] if score @s local.player.id = @p local.player.id at @s run function bubblellaneous:block/telescope/tick
tag @s remove --local.player
