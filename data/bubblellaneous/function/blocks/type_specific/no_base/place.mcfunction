$summon interaction ~ ~-0.51 ~ {Tags: ["+bubblellaneous", "bbln.base", "bbln.base.$(name)", "--bbln.new"], width: 1.01f, height: 1.02f, response: 1b}

scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1] remove --bbln.new
