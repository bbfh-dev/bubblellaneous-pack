scoreboard players operation #id_test bbln.tmp = @s bbln.block.id
execute as @e[type=item_display,tag=bbln.telescope_lens,predicate=bubblellaneous:check/block.id,limit=1,x=0] positioned as @s run function bubblellaneous:block/telescope/internal/tick
execute as @e[type=item_display,tag=bbln.name.telescope,predicate=bubblellaneous:check/block.id,limit=1,x=0] positioned as @s run function bubblellaneous:block/telescope/internal/tick_last
