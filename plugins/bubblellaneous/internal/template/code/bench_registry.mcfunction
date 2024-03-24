data modify storage bubblellaneous bench_registry set value {}
data modify storage bubblellaneous bench_registry.furniture set value [furniture]
data modify storage bubblellaneous bench_registry.technology set value [technology]
data modify storage bubblellaneous bench_registry.food set value [food]
data modify storage bubblellaneous bench_registry.miscellaneous set value [miscellaneous]

execute store result score registry.furniture.pages local.var store result score registry.furniture.size local.var run data get storage bubblellaneous bench_registry.furniture
scoreboard players operation registry.furniture.pages local.var /= 18 local.int
scoreboard players add registry.furniture.pages local.var 1

execute store result score registry.technology.pages local.var store result score registry.technology.size local.var run data get storage bubblellaneous bench_registry.technology
scoreboard players operation registry.technology.pages local.var /= 18 local.int
scoreboard players add registry.technology.pages local.var 1

execute store result score registry.food.pages local.var store result score registry.food.size local.var run data get storage bubblellaneous bench_registry.food
scoreboard players operation registry.food.pages local.var /= 18 local.int
scoreboard players add registry.food.pages local.var 1

execute store result score registry.miscellaneous.pages local.var store result score registry.miscellaneous.size local.var run data get storage bubblellaneous bench_registry.miscellaneous
scoreboard players operation registry.miscellaneous.pages local.var /= 18 local.int
scoreboard players add registry.miscellaneous.pages local.var 1

data modify storage bubblellaneous version set value "[version]"
function bubblellaneous:block/bubble_bench/blacklist/load
