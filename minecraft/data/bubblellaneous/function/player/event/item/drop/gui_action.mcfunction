execute store result score slot local.tmp run function bubblellaneous:block/bubble_bench/as_player/determine_empty_slot
execute anchored eyes positioned ^ ^ ^2 as @e[type=item_display,tag=local.name.bubble_bench,limit=1,sort=nearest] at @s run function bubblellaneous:block/bubble_bench/render

# Ignore empty slots
execute as @s[nbt={Item: {components: {"minecraft:item_model": "bubblellaneous:ui_air"}}}] run return run kill @s
execute as @s[nbt={Item: {components: {"minecraft:item_model": "bubblellaneous:ui_slot"}}}] run return run kill @s
execute as @s[nbt={Item: {id: "minecraft:structure_void"}}] run return run kill @s

tag @s add --local.tmp
execute if data entity @s Item.components."minecraft:entity_data".Item.components.minecraft:custom_data.bubblellaneous.block_data as @p[tag=--local.player] run function bubblellaneous:block/bubble_bench/show_docs with entity @e[type=item,tag=--local.tmp,limit=1] Item.components.minecraft:custom_data.minecraft:entity_data.Item.components.minecraft:custom_data.bubblellaneous.block_data
execute if data entity @s Item.components.minecraft:custom_data.bubblellaneous.item_data as @p[tag=--local.player] run function bubblellaneous:block/bubble_bench/show_docs with entity @e[type=item,tag=--local.tmp,limit=1] Item.components.minecraft:custom_data.bubblellaneous.item_data
kill @s
