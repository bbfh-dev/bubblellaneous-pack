execute store result score count local.tmp run data get storage bubblellaneous tmp.entry.count
execute store result storage bubblellaneous tmp.entry.at int 1 run scoreboard players get container.i local.tmp
function bubblellaneous:block/bubble_bench/entry/insert_item with storage bubblellaneous tmp.entry
