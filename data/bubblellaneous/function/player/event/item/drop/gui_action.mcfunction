execute store result score slot bbln.tmp run function bubblellaneous:block/bubble_bench/as_player/determine_empty_slot
execute anchored eyes positioned ^ ^ ^2 as @e[type=item_display,tag=bbln.name.bubble_bench,limit=1,sort=nearest,distance=..8] at @s run function bubblellaneous:block/bubble_bench/render

# Ignore empty slots
execute if items entity @s contents *[minecraft:item_model="bubblellaneous:ui_air"] run return run kill @s
execute if items entity @s contents *[minecraft:item_model="bubblellaneous:ui_slot"] run return run kill @s
execute if items entity @s contents minecraft:structure_void run return run kill @s

tag @s add --bbln.tmp
execute if data entity @s Item.components.minecraft:entity_data.Item.components.minecraft:custom_data.bubblellaneous.block_data as @a[tag=--bbln.player,limit=1,x=0] run function bubblellaneous:block/bubble_bench/show_docs with entity @e[type=item,tag=--bbln.tmp,limit=1,x=0] Item.components.minecraft:entity_data.Item.components.minecraft:custom_data.bubblellaneous.block_data
execute if data entity @s Item.components.minecraft:custom_data.bubblellaneous.item_data as @a[tag=--bbln.player,limit=1,x=0] run function bubblellaneous:block/bubble_bench/show_docs with entity @e[type=item,tag=--bbln.tmp,limit=1,x=0] Item.components.minecraft:custom_data.bubblellaneous.item_data
kill @s
