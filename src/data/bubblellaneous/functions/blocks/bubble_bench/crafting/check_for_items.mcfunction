$execute store result score count local.tmp run clear @p[tag=--local.player] minecraft:$(id) 0
$execute unless score count local.tmp matches $(count).. run scoreboard players set has_items local.tmp 0
$execute unless score count local.tmp matches $(count).. run return 0

data remove storage bubblellaneous tmp.test_recipe[-1]
scoreboard players remove length.1 local.tmp 1
execute if score length.1 local.tmp matches 1.. run function bubblellaneous:blocks/bubble_bench/crafting/check_for_items with storage bubblellaneous tmp.test_recipe[-1]
