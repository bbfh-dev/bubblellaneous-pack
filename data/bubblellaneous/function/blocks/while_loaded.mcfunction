tag @s remove --bbln.loaded

execute if entity @s[tag=!--bbln.uses.no_base] if block ~ ~ ~ #bubblellaneous:breaks_block run function bubblellaneous:blocks/break
execute if entity @s[tag=--bbln.uses.tick] run function bubblellaneous:blocks/uses/tick/run with entity @s item.components.minecraft:custom_data.bubblellaneous.block_data
execute if entity @s[tag=--bbln.uses.gui] if block ~ ~-1 ~ hopper[enabled=true] run setblock ~ ~-1 ~ hopper[enabled=false]
