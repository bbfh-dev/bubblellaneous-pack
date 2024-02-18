$execute if score @s local.block.state matches 0 run data modify storage bubblellaneous bench_blacklist.furniture append value "$(group)/$(name)"
$execute if score @s local.block.state matches 1 run data modify storage bubblellaneous bench_blacklist.technology append value "$(group)/$(name)"
$execute if score @s local.block.state matches 2 run data modify storage bubblellaneous bench_blacklist.food append value "$(group)/$(name)"
$execute if score @s local.block.state matches 3 run data modify storage bubblellaneous bench_blacklist.miscellaneous append value "$(group)/$(name)"
function bubblellaneous:blocks/bubble_bench/schedule/blacklist/load
function bubblellaneous:blocks/bubble_bench/gui/load
