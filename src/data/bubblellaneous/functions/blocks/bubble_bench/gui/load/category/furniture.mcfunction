function bubblellaneous:blocks/bubble_bench/gui/load/category/generic {category: "furniture"}

execute store result score size local.tmp run data get storage bubblellaneous tmp.category
execute if score i local.tmp < size local.tmp run scoreboard players set bit.1 local.tmp 1
