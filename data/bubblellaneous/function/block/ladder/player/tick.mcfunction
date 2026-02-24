execute unless predicate bubblellaneous:block/ladder_motion run function bubblellaneous:block/ladder/player/motion_reset

execute if predicate bubblellaneous:input/jump run return run function bubblellaneous:block/ladder/player/climb_up
execute if predicate bubblellaneous:input/wasd positioned ~-0.3 ~ ~-0.3 if entity @e[type=minecraft:interaction,tag=bbln.ladder,limit=1,dx=0] positioned ~-0.4 ~ ~-0.4 if entity @e[type=minecraft:interaction,tag=bbln.ladder,limit=1,dx=0] positioned ~0.7 ~ ~0.7 if function bubblellaneous:block/ladder/player/climb_up_motion run return run function bubblellaneous:block/ladder/player/climb_up
execute if predicate bubblellaneous:input/sneak run return run function bubblellaneous:block/ladder/player/climb_sneak
execute if entity @s[tag=--bbln.ladder.sneak] run function bubblellaneous:block/ladder/player/climb_sneak_remove
function bubblellaneous:block/ladder/player/climb_down
