execute store result score slot local.tmp run function bubblellaneous:block/bubble_bench/as_player/determine_empty_slot
execute anchored eyes positioned ^ ^ ^2 as @e[type=item_display,tag=local.name.bubble_bench,limit=1,sort=nearest] at @s run function bubblellaneous:block/bubble_bench/render

# Ignore empty slots
execute as @s[nbt={Item: {tag: {CustomModelData: 370000}}}] run return run kill @s
execute as @s[nbt={Item: {tag: {CustomModelData: 370001}}}] run return run kill @s
execute as @s[nbt={Item: {id: "minecraft:structure_void"}}] run return run kill @s

tag @s add --local.tmp
execute if data entity @s Item.tag.EntityTag.Item.tag.bubblellaneous.block_data as @p[tag=--local.player] run function bubblellaneous:block/bubble_bench/show_docs with entity @e[type=item,tag=--local.tmp,limit=1] Item.tag.EntityTag.Item.tag.bubblellaneous.block_data
execute if data entity @s Item.tag.bubblellaneous.item_data as @p[tag=--local.player] run function bubblellaneous:block/bubble_bench/show_docs with entity @e[type=item,tag=--local.tmp,limit=1] Item.tag.bubblellaneous.item_data
kill @s
