tag @s add --local.this
execute as @e[type=item_display,tag=local.telescope_lens] if score @s local.block.id = @e[type=item_display,tag=--local.this,limit=1] local.block.id at @s run function bubblellaneous:block/telescope/internal/tick
tag @s remove --local.this
