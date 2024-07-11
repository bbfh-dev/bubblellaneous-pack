tag @s remove --local.loaded

execute if block ~ ~ ~ #bubblellaneous:breaks_block as @s[tag=!--local.uses.no_base] run function bubblellaneous:blocks/break
execute as @s[tag=--local.uses.tick] run function bubblellaneous:blocks/uses/tick/run with entity @s item.components.minecraft:custom_data.bubblellaneous.block_data
execute as @s[tag=--local.uses.gui] if block ~ ~-1 ~ hopper[enabled=true] run setblock ~ ~-1 ~ hopper[enabled=false]
