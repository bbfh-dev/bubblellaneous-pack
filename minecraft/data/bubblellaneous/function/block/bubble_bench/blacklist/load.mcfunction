execute store result score length local.tmp run data get storage bubblellaneous bench_blacklist
execute if score length local.tmp matches 0 run return 0

data modify storage bubblellaneous tmp.blacklist set from storage bubblellaneous bench_blacklist
function bubblellaneous:block/bubble_bench/blacklist/loop with storage bubblellaneous tmp.blacklist[-1]
