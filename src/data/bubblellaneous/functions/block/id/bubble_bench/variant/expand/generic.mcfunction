$data modify storage bubblellaneous tmp.data set from storage bubblellaneous bench_registry.$(category)[{item: "$(group)/$(name)"}]
execute store result storage bubblellaneous tmp.input.index int 1 run data get storage bubblellaneous tmp.data.index

function bubblellaneous:block/id/bubble_bench/variant/set_items with storage bubblellaneous tmp.input
scoreboard players set @s local.block_state 1

function bubblellaneous:block/id/bubble_bench/render
