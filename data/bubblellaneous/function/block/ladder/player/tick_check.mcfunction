execute unless predicate bubblellaneous:check/flying align xyz if entity @e[type=minecraft:item_display,tag=bbln.name.ladder,limit=1,dx=0] positioned as @s run return run function bubblellaneous:block/ladder/player/tick
execute if entity @s[tag=--bbln.ladder.effect] run function bubblellaneous:block/ladder/player/remove
