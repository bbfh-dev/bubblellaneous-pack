tag @s remove --local.loaded

execute if block ~ ~ ~ #bubblellaneous:breaks_block as @s[tag=!--local.uses.no_base] run function bubblellaneous:blocks/break
execute as @s[tag=--local.uses.tick] run function bubblellaneous:blocks/uses/tick/run with entity @s item.tag.bubblellaneous.block_data
