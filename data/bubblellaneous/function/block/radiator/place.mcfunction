summon interaction ~ ~-0.501 ~ {Tags: ["+bubblellaneous", "bbln.radiator", "bbln.base", "--bbln.new"], response: 1b, width: 1.002f, height: 1.002f}
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,distance=..1] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,distance=..1] remove --bbln.new

