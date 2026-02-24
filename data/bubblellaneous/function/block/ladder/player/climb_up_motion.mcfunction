scoreboard players set #x bbln.tmp 0
scoreboard players set #z bbln.tmp 0
execute if predicate bubblellaneous:input/forward run scoreboard players remove #z bbln.tmp 1
execute if predicate bubblellaneous:input/backward run scoreboard players add #z bbln.tmp 1
execute if predicate bubblellaneous:input/left run scoreboard players remove #x bbln.tmp 1
execute if predicate bubblellaneous:input/right run scoreboard players add #x bbln.tmp 1
execute store result storage minecraft:bubblellaneous tmp.x int 1 run scoreboard players get #x bbln.tmp
execute store result storage minecraft:bubblellaneous tmp.z int 1 run scoreboard players get #z bbln.tmp
return run function bubblellaneous:block/ladder/player/climb_up_motion2 with storage minecraft:bubblellaneous tmp

#function bubblellaneous:block/ladder/player/wasd_pre
#execute if predicate bubblellaneous:block/ladder_motion
