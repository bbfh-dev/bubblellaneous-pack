function bubblellaneous:blocks/bubble_bench/gui/load/gui/entry/next_container_index

execute store result score count local.tmp run data get storage bubblellaneous tmp.entry.count
execute store result storage bubblellaneous tmp.entry.at int 1 run scoreboard players get container.i local.tmp
function bubblellaneous:blocks/bubble_bench/gui/load/gui/entry/insert_item with storage bubblellaneous tmp.entry
