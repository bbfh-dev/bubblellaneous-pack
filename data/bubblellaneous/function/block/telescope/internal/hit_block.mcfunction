effect give @a[tag=--bbln.player,limit=1,x=0] blindness 1 0 true
#tag @s add --bbln.telescope.blindness
execute store result storage minecraft:bubblellaneous tmp.temp int 1 run scoreboard players get #distance bbln.tmp
function bubblellaneous:block/telescope/internal/tp with storage minecraft:bubblellaneous tmp
