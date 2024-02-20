execute if block ~ ~ ~ #bubblellaneous:air as @s[tag=!--local.uses.no_base] run function bubblellaneous:blocks/break with entity @s item.tag.block_data
execute as @s[tag=!--local.uses.tick] run return 0

execute as @s[tag=--local.name.washer] run function bubblellaneous:blocks/washer/tick
