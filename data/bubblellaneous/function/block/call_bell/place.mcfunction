summon interaction ~ ~-0.5 ~ {Tags: ["+bubblellaneous", "bbln.call_bell", "bbln.base", "--bbln.new"], width: 0.375f, height: 0.25f, response: 1b}
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,distance=..1] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,distance=..1] remove --bbln.new
