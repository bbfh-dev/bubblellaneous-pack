execute if entity @p[tag=--bbln.player,gamemode=creative] run function bubblellaneous:block/bubble_bench/item/give with storage bubblellaneous tmp.input
execute if entity @p[tag=--bbln.player,gamemode=!creative] run function bubblellaneous:block/bubble_bench/item/craft with storage bubblellaneous tmp.input

scoreboard players remove amount bbln.tmp 1
execute if score amount bbln.tmp matches 1.. run function bubblellaneous:block/bubble_bench/item/shift_click
