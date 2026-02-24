playsound ui.button.click block @a[tag=--bbln.player,limit=1,distance=..16] ~ ~ ~ 0.25 1 0
function bubblellaneous:block/bubble_bench/render

execute store result storage bubblellaneous tmp.input.at int 1 run scoreboard players get slot bbln.tmp
function bubblellaneous:block/bubble_bench/entry/fetch/by_index with storage bubblellaneous tmp.input

# Ignore empty slots
execute if data storage bubblellaneous tmp.entry.components{"minecraft:item_model": "bubblellaneous:ui_air"} run return 0
execute if data storage bubblellaneous tmp.entry.components{"minecraft:item_model": "bubblellaneous:ui_slot"} run return 0

execute if data storage bubblellaneous tmp.entry{id: "minecraft:structure_void"} run return run function bubblellaneous:block/bubble_bench/entry/event/click_gui
function bubblellaneous:block/bubble_bench/entry/event/click_item
