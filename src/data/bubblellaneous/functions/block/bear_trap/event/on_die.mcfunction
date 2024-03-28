execute as @e[type=item_display,tag=local.name.bear_trap] if score @s local.player.id = @p local.player.id at @s run function bubblellaneous:block/bear_trap/timeout
