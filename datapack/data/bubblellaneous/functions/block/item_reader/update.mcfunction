execute if block ~ ~ ~ barrel[open=true] run function bubblellaneous:block/item_reader/while_opened
execute if score @s buln.data0 matches 1 run function bubblellaneous:block/item_reader/lock
execute if score @s buln.data0 matches 1.. run scoreboard players remove @s buln.data0 1