data modify storage bubblellaneous tmp.input set value {category: "furniture"}
data modify storage bubblellaneous tmp.input.name set from storage bubblellaneous tmp.array[-1]
function bubblellaneous:blocks/bubble_bench/schedule/blacklist/add with storage bubblellaneous tmp.input

data remove storage bubblellaneous tmp.array[-1]
scoreboard players remove length local.tmp 1
execute if score length local.tmp matches 1.. run function bubblellaneous:blocks/bubble_bench/schedule/blacklist/furniture
