$loot replace block ~ ~ ~ container.$(at) loot bubblellaneous:$(name)
$item modify block ~ ~ ~ container.$(at) bubblellaneous:block/mark_as_gui

$execute if score count local.tmp matches 2.. run item modify block ~ ~ ~ container.$(at) bubblellaneous:block/bubble_bench/set_variants_lore
$execute if score count local.tmp matches 1 run item modify block ~ ~ ~ container.$(at) bubblellaneous:block/bubble_bench/set_item_lore
