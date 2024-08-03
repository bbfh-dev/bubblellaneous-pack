$data modify entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.items set from storage bubblellaneous bench_registry.$(category)[$(index)].items
scoreboard players operation @s local.gui.previous_page = @s local.gui.page
scoreboard players set @s local.gui.page 1
