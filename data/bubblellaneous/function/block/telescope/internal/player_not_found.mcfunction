execute unless predicate bubblellaneous:input/jump run scoreboard players remove #distance bbln.tmp 1
execute store result storage minecraft:bubblellaneous tmp.temp int 1 run scoreboard players get #distance bbln.tmp
function bubblellaneous:block/telescope/internal/tp with storage minecraft:bubblellaneous tmp
