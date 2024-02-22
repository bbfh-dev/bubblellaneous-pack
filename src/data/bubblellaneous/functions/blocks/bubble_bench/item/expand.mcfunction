$execute if score @s local.block.state matches 0 store result score index local.tmp store result storage bubblellaneous tmp.input.index int 1 run data get storage bubblellaneous bench_registry.furniture[{name: "$(group)/$(name)"}].index
$execute if score @s local.block.state matches 1 store result score index local.tmp store result storage bubblellaneous tmp.input.index int 1 run data get storage bubblellaneous bench_registry.technology[{name: "$(group)/$(name)"}].index
$execute if score @s local.block.state matches 2 store result score index local.tmp store result storage bubblellaneous tmp.input.index int 1 run data get storage bubblellaneous bench_registry.food[{name: "$(group)/$(name)"}].index
$execute if score @s local.block.state matches 3 store result score index local.tmp store result storage bubblellaneous tmp.input.index int 1 run data get storage bubblellaneous bench_registry.miscellaneous[{name: "$(group)/$(name)"}].index
function bubblellaneous:blocks/bubble_bench/item/internal/set_items with storage bubblellaneous tmp.input
scoreboard players operation @s local.on_drop = @s local.block.state
scoreboard players set @s local.block.state -1

function bubblellaneous:blocks/bubble_bench/gui/load
