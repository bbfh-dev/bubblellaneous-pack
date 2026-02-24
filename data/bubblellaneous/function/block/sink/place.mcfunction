summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.base.sink", "bbln.base", "--bbln.new"], width: 0.875f, height: 0.4375f, response: 1b}
execute align xyz positioned ~0.5 ~ ~0.5 run tp @e[type=interaction,tag=--bbln.new,limit=1,x=0] ^ ^0.563 ^0.062 ~ ~
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,x=0] remove --bbln.new
