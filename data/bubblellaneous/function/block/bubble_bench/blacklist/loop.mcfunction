$data remove storage bubblellaneous bench_registry.furniture[{item: "$(entry)"}]
$data remove storage bubblellaneous bench_registry.technology[{item: "$(entry)"}]
$data remove storage bubblellaneous bench_registry.food[{item: "$(entry)"}]
$data remove storage bubblellaneous bench_registry.miscellaneous[{item: "$(entry)"}]

data remove storage bubblellaneous tmp.blacklist[-1]
execute if data storage bubblellaneous tmp.blacklist[0] run function bubblellaneous:block/bubble_bench/blacklist/loop with storage bubblellaneous tmp.blacklist[-1]
