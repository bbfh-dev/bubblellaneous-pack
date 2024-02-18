scoreboard players add current_slot local.tmp 1
execute if score current_slot local.tmp matches 9..11 run scoreboard players set current_slot local.tmp 12
execute if score current_slot local.tmp matches 18..20 run scoreboard players set current_slot local.tmp 21

execute store result storage bubblellaneous tmp.input.block_slot int 1 run scoreboard players get current_slot local.tmp
execute store result storage bubblellaneous tmp.input.item_id int 1 run scoreboard players add from local.tmp 1
function bubblellaneous:blocks/bubble_bench/gui/entry/add with storage bubblellaneous tmp.input

scoreboard players remove registry.max_entries local.tmp 1
execute if score registry.max_entries local.tmp matches 1.. run function bubblellaneous:blocks/bubble_bench/gui/entry/loop
