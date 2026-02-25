data modify storage bubblellaneous tmp.blacklist set from storage bubblellaneous bench_blacklist
execute if data storage bubblellaneous tmp.blacklist[0] run function ./loop with storage bubblellaneous tmp.blacklist[-1]
	$data remove storage bubblellaneous registry.furniture[{item: "$(entry)"}]
	$data remove storage bubblellaneous registry.technology[{item: "$(entry)"}]
	$data remove storage bubblellaneous registry.food[{item: "$(entry)"}]
	$data remove storage bubblellaneous registry.miscellaneous[{item: "$(entry)"}]

	data remove storage bubblellaneous tmp.blacklist[-1]
	execute if data storage bubblellaneous tmp.blacklist[0] run function ./loop with storage bubblellaneous tmp.blacklist[-1]
