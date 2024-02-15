$loot replace block ~ ~ ~ container.$(slot) loot bubblellaneous:$(entry)
$scoreboard players set amount local.tmp $(count)
$item modify block ~ ~ ~ container.$(slot) bubblellaneous:block/copy_count
$item modify block ~ ~ ~ container.$(slot) bubblellaneous:block/mark_as_gui
