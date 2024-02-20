#region Get bench registry entry
$data modify storage bubblellaneous tmp.input set value {category: "$(category)"}
execute store result storage bubblellaneous tmp.input.index int 1 run scoreboard players get i local.tmp
function bubblellaneous:blocks/bubble_bench/gui/load/ui/entry/get_by_category with storage bubblellaneous tmp.input

execute if score container.i local.tmp matches 26.. run return 0
execute unless data storage bubblellaneous tmp.entry.name run return 0
#endregion

function bubblellaneous:blocks/bubble_bench/gui/load/ui/entry/render

scoreboard players add i local.tmp 1
$function bubblellaneous:blocks/bubble_bench/gui/load/category/$(category)
