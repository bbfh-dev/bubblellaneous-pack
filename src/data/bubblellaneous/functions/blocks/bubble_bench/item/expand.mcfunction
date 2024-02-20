$execute store result score index local.tmp store result storage bubblellaneous tmp.input.index int 1 run data get storage bubblellaneous bench_registry.furniture[{name: "$(group)/$(name)"}].index
function bubblellaneous:blocks/bubble_bench/item/internal/set_items with storage bubblellaneous tmp.input
scoreboard players operation @s local.on_drop = @s local.block.state
scoreboard players set @s local.block.state -1

function bubblellaneous:blocks/bubble_bench/gui/load
