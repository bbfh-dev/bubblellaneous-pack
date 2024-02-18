data modify storage bubblellaneous tmp.array set from storage bubblellaneous bench_blacklist.furniture
execute store result score length local.tmp run data get storage bubblellaneous tmp.array
execute if score length local.tmp matches 1.. run function bubblellaneous:blocks/bubble_bench/schedule/blacklist/furniture
