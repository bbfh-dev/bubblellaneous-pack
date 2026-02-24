execute if score @s bbln.block.timer matches 1.. run return 0

execute store result score @s bbln.block_state if score @s bbln.block_state matches 0

tag @s add --bbln.this
execute if score @s bbln.block_state matches 1 run tag @s add --bbln.uses.no_base
execute if score @s bbln.block_state matches 0 as @e[type=item_display,tag=bbln.hatch,predicate=bubblellaneous:check/block.id,limit=1,x=0] run function bubblellaneous:block/hatch/internal/close
execute if score @s bbln.block_state matches 1 as @e[type=item_display,tag=bbln.hatch,predicate=bubblellaneous:check/block.id,limit=1,x=0] run function bubblellaneous:block/hatch/internal/open
tag @s remove --bbln.this
