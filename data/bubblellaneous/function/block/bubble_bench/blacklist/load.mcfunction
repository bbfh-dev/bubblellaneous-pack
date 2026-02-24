data modify storage bubblellaneous tmp.blacklist set from storage bubblellaneous bench_blacklist
execute if data storage bubblellaneous tmp.blacklist[0] run function bubblellaneous:block/bubble_bench/blacklist/loop with storage bubblellaneous tmp.blacklist[-1]
