summon interaction ~ ~-0.5 ~ {Tags: ["+bubblellaneous", "bbln.shelf", "bbln.base", "--bbln.new"], response: 1b, width: 0.875f, height: 0.4375f}
scoreboard players set @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block_state 0
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,x=0] remove --bbln.new
