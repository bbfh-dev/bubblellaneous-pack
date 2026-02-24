$execute store result score count bbln.tmp run clear @p[tag=--bbln.player] minecraft:$(id) 0
$execute unless score count bbln.tmp matches $(count).. run return run scoreboard players set has_items bbln.tmp 0

data remove storage bubblellaneous tmp.test_recipe[-1]
scoreboard players remove length.1 bbln.tmp 1
execute if score length.1 bbln.tmp matches 1.. run function bubblellaneous:block/bubble_bench/crafting/check_for_items with storage bubblellaneous tmp.test_recipe[-1]
