execute store result score #killed_items bbln.tmp if entity @s[tag=!--bbln.ignore.break_dropped_items] run function bubblellaneous:blocks/kill_dropped_items

execute if function #bubblellaneous:block/all/on_break run return 0
setblock ~ ~ ~ air

execute store result score #uses_blockstates bbln.tmp if entity @s[tag=--bbln.uses.blockstates,tag=!--bbln.ignore.blockstates_after_break]
function bubblellaneous:block_placer/ignore_block_properties
function bubblellaneous:block_placer/return_block with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data
function bubblellaneous:blocks/emmit_particles with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data
function bubblellaneous:blocks/kill

execute if score #uses_blockstates bbln.tmp matches 1 run function bubblellaneous:block_placer/internal/update_blockstates with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data
