summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.ladder", "bbln.base", "--bbln.new"], width: 0.95f, height: 0.95f, response: 0b}
execute align xyz positioned ~0.5 ~ ~0.5 run tp @e[type=interaction,tag=--bbln.new,limit=1,x=0] ^ ^ ^-0.687 ~ ~
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,x=0] remove --bbln.new

