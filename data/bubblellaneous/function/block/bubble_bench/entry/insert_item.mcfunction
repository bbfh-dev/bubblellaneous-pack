$loot replace block ~ ~ ~ container.$(at) loot bubblellaneous:$(item)
$item modify block ~ ~ ~ container.$(at) bubblellaneous:blocks/mark_as_gui

$execute if score count bbln.tmp matches 1.. run item modify block ~ ~ ~ container.$(at) bubblellaneous:bubble_bench/set_lore/variant

$execute if score count bbln.tmp matches 0 run item modify block ~ ~ ~ container.$(at) bubblellaneous:bubble_bench/set_lore/item
$function bubblellaneous:generated/recipe/$(item)
data modify storage bubblellaneous tmp.in.recipe set from storage bubblellaneous tmp.out.recipe
function bubblellaneous:block/bubble_bench/recipe/generate
$execute if score count bbln.tmp matches 0 run data modify block ~ ~ ~ Items[$(at)].components."minecraft:lore" insert 2 from storage bubblellaneous tmp.out.recipe[]
