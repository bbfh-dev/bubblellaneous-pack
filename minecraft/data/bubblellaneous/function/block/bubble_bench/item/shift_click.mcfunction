execute if entity @p[tag=--local.player,gamemode=creative] run function bubblellaneous:block/bubble_bench/item/give with storage bubblellaneous tmp.input
execute if entity @p[tag=--local.player,gamemode=!creative] run function bubblellaneous:block/bubble_bench/item/craft with storage bubblellaneous tmp.input

scoreboard players remove amount local.tmp 1
execute if score amount local.tmp matches 1.. run function bubblellaneous:block/bubble_bench/item/shift_click
