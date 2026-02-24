summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.curtains", "bbln.base", "--bbln.new"], response: 1b, width: 1f, height: 1f}
execute align xyz positioned ~0.5 ~ ~0.5 run tp @e[type=interaction,tag=--bbln.new,limit=1,distance=..1] ^ ^ ^-0.45 ~ ~
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,distance=..1] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,distance=..1] remove --bbln.new

