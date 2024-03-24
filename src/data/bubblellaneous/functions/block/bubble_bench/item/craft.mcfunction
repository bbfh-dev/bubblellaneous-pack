#region Get the crafting recipe
data modify storage bubblellaneous tmp.out.recipe set value []
$function bubblellaneous:generated/recipe/$(group)/$(item)
#endregion

data modify storage bubblellaneous tmp.test_recipe set from storage bubblellaneous tmp.out.recipe
execute store result score length.1 local.tmp store result score length.2 local.tmp run data get storage bubblellaneous tmp.out.recipe

#region No recipe
execute if score length.1 local.tmp matches 0 run return run function bubblellaneous:block/bubble_bench/item/give with storage bubblellaneous tmp.input
#endregion

scoreboard players set has_items local.tmp 1
function bubblellaneous:block/bubble_bench/crafting/check_for_items with storage bubblellaneous tmp.test_recipe[-1]
execute if score has_items local.tmp matches 0 run function bubblellaneous:block/bubble_bench/crafting/error with storage bubblellaneous tmp.input
execute if score has_items local.tmp matches 1 run function bubblellaneous:block/bubble_bench/crafting/take_items with storage bubblellaneous tmp.out.recipe[-1]
execute if score has_items local.tmp matches 1 run function bubblellaneous:block/bubble_bench/item/give with storage bubblellaneous tmp.input
