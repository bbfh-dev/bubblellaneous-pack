summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.base.electrical_box", "bbln.base", "--bbln.new"], width: 0.625f, height: 0.75f, response: 1b}
execute align xyz positioned ~0.5 ~ ~0.5 run tp @e[type=interaction,tag=--bbln.new,limit=1,x=0] ^ ^0.125 ^-0.5625 ~ ~
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,x=0] remove --bbln.new
