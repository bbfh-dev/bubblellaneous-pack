#region Get bench registry entry
execute store result storage bubblellaneous tmp.input.index int 1 run scoreboard players get i local.tmp
function bubblellaneous:block/bubble_bench/entry/fetch/by_variant with storage bubblellaneous tmp.input

execute if score container.i local.tmp matches 26.. run return 0
execute unless data storage bubblellaneous tmp.entry.item run return 0
#endregion

#region Get next container index
scoreboard players add container.i local.tmp 1
execute if score container.i local.tmp matches 9..11 run scoreboard players set container.i local.tmp 12
execute if score container.i local.tmp matches 18..20 run scoreboard players set container.i local.tmp 21
#endregion

function bubblellaneous:block/bubble_bench/entry/render

scoreboard players add i local.tmp 1
function bubblellaneous:block/bubble_bench/render/variant/loop
