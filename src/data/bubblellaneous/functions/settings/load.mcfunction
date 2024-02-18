schedule clear bubblellaneous:blocks/bubble_bench/schedule/obtaining/tick

execute if score bubble_bench.allow_obtaining local.settings matches 1 run function bubblellaneous:blocks/bubble_bench/schedule/obtaining/tick
execute if data storage bubblellaneous bench_blacklist run schedule function bubblellaneous:blocks/bubble_bench/schedule/blacklist/load 2t replace
