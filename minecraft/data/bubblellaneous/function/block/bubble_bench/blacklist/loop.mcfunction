$data remove storage bubblellaneous bench_registry.furniture[{item: "$(entry)"}]
$data remove storage bubblellaneous bench_registry.technology[{item: "$(entry)"}]
$data remove storage bubblellaneous bench_registry.food[{item: "$(entry)"}]
$data remove storage bubblellaneous bench_registry.miscellaneous[{item: "$(entry)"}]

scoreboard players remove length local.tmp 1
data remove storage bubblellaneous tmp.blacklist[-1]
execute if score length local.tmp matches 1.. run function bubblellaneous:block/bubble_bench/blacklist/loop with storage bubblellaneous tmp.blacklist[-1]
