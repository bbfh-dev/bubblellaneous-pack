$execute store result score count local.tmp run clear @p[tag=--local.player] minecraft:$(id) $(count)

data remove storage bubblellaneous tmp.recipe[-1]
scoreboard players remove length.2 local.tmp 1
execute if score length.2 local.tmp matches 1.. run function bubblellaneous:blocks/bubble_bench/crafting/take_items with storage bubblellaneous tmp.recipe[-1]
