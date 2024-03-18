execute if score @s local.block.timer matches 1.. run return 0

execute store result score block_state local.tmp run scoreboard players get @s local.block_state
execute if score block_state local.tmp matches 0 run scoreboard players set @s local.block_state 1
execute if score block_state local.tmp matches 1 run scoreboard players set @s local.block_state 0

tag @s add --local.this
execute if score @s local.block_state matches 0 as @e[type=item_display,tag=local.hatch] if score @s local.block.id = @e[type=item_display,tag=--local.this,limit=1] local.block.id run function bubblellaneous:block/hatch/internal/close
execute if score @s local.block_state matches 1 as @e[type=item_display,tag=local.hatch] if score @s local.block.id = @e[type=item_display,tag=--local.this,limit=1] local.block.id run function bubblellaneous:block/hatch/internal/open
tag @s remove --local.this
