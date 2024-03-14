$loot replace block ~ ~ ~ container.$(at) loot bubblellaneous:$(item)
$item modify block ~ ~ ~ container.$(at) bubblellaneous:block/mark_as_gui

$execute if score count local.tmp matches 1.. run item modify block ~ ~ ~ container.$(at) bubblellaneous:bubble_bench/set_lore/variant

$execute if score count local.tmp matches 0 run item modify block ~ ~ ~ container.$(at) bubblellaneous:bubble_bench/set_lore/item
data modify storage bubblellaneous tmp.recipe set value []
$function bubblellaneous:generated/recipe/$(item)
$execute if score count local.tmp matches 0 run data modify block ~ ~ ~ Items[$(at)].tag.display.Lore insert 2 from storage bubblellaneous tmp.out.recipe[].lore
