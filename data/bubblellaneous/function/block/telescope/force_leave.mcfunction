scoreboard players operation #id_test bbln.tmp = @s bbln.block.id
execute as @e[type=item_display,tag=bbln.name.telescope,predicate=bubblellaneous:check/block.id,limit=1,x=0] at @s run function bubblellaneous:block/telescope/quit
