advancement revoke @s only bubblellaneous:player/event/break_no_base_block
function bubblellaneous:player/event/get_hurted/main {type: "interaction", tag: "base"}
#execute unless entity @s[gamemode=creative] unless entity @s[gamemode=survival,predicate=!bubblellaneous:input/sneak] run return run tag @e[type=interaction,tag=--bbln.target_entity,limit=1,x=0] remove --bbln.target_entity

scoreboard players operation #id_test bbln.tmp = @e[type=interaction,tag=--bbln.target_entity,limit=1,x=0] bbln.block.id
execute as @e[type=item_display,tag=bbln.block,predicate=bubblellaneous:check/block.id,limit=1,x=0] at @s run function bubblellaneous:blocks/break with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data

function bubblellaneous:player/event/generic/end
