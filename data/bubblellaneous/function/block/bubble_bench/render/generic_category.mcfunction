$scoreboard players operation size bbln.tmp = registry.$(category).size bbln.var
$scoreboard players operation max_pages bbln.tmp = registry.$(category).pages bbln.var

#region Get bench registry entry
$data modify storage bubblellaneous tmp.input set value {category: "$(category)"}
execute store result storage bubblellaneous tmp.input.index int 1 run scoreboard players get i bbln.tmp
function bubblellaneous:block/bubble_bench/entry/fetch/by_category with storage bubblellaneous tmp.input

execute if score container.i bbln.tmp matches 26.. run return 0
execute if data storage bubblellaneous tmp.entry.size run function ./_copy_from_first_variant
	data modify storage bubblellaneous tmp.size set from storage bubblellaneous tmp.entry.size
	data modify storage bubblellaneous tmp.entry set from storage bubblellaneous tmp.entry.items[0]
	data modify storage bubblellaneous tmp.entry.size set from storage bubblellaneous tmp.size
#endregion

#region Get next container index
scoreboard players add container.i bbln.tmp 1
execute if score container.i bbln.tmp matches 9..11 run scoreboard players set container.i bbln.tmp 12
execute if score container.i bbln.tmp matches 18..20 run scoreboard players set container.i bbln.tmp 21
#endregion

function bubblellaneous:block/bubble_bench/entry/render

scoreboard players add i bbln.tmp 1
$function bubblellaneous:block/bubble_bench/render/generic_category {category: "$(category)"}
