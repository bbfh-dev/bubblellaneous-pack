execute if data storage bubblellaneous tmp.entry.components."minecraft:entity_data".Item.components.minecraft:custom_data.bubblellaneous.block_data run function bubblellaneous:block/bubble_bench/entry/craft_block
execute if data storage bubblellaneous tmp.entry.components.minecraft:custom_data.bubblellaneous.item_data run function bubblellaneous:block/bubble_bench/entry/craft_item
execute if entity @p[tag=--bbln.player,gamemode=creative] run function bubblellaneous:block/bubble_bench/item/give with storage bubblellaneous tmp.input
execute if entity @p[tag=--bbln.player,gamemode=!creative] run function bubblellaneous:block/bubble_bench/item/craft with storage bubblellaneous tmp.input
