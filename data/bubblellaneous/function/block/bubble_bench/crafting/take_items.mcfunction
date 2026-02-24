$execute store result score count bbln.tmp run clear @p[tag=--bbln.player] minecraft:$(id) $(count)

data remove storage bubblellaneous tmp.out.recipe[-1]
scoreboard players remove length.2 bbln.tmp 1
execute if score length.2 bbln.tmp matches 1.. run function bubblellaneous:block/bubble_bench/crafting/take_items with storage bubblellaneous tmp.out.recipe[-1]
