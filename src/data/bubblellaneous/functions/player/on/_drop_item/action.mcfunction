execute store success score is_gui local.tmp run data get entity @s Item.tag.bubblellaneous.is_gui
execute if score is_gui local.tmp matches 0 run return 0

execute store result score slot local.tmp run function bubblellaneous:player/gui/action/_shift_click/determine_empty_slot
execute anchored eyes positioned ^ ^ ^2 as @e[type=item_display,tag=--local.name.bubble_bench,limit=1,sort=nearest] at @s run function bubblellaneous:player/on/_drop_item/item

kill @s

# Ignore empty slots
execute if data storage bubblellaneous tmp.entry.tag{CustomModelData: 370000} run return 0
execute if data storage bubblellaneous tmp.entry.tag{CustomModelData: 370001} run return 0
execute if data storage bubblellaneous tmp.entry{id: "minecraft:structure_void"} run return 0

execute as @p[tag=--local.player] run function bubblellaneous:player/on/_drop_item/show_docs with storage bubblellaneous tmp.entry.tag.EntityTag.Item.tag.block_data
