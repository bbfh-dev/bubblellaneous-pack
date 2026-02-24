$summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.seat", "bbln.base", "--bbln.new"], response: 1b, width: $(width)f, height: 0.02f}
$execute align xyz positioned ~0.5 ~ ~0.5 run tp @e[type=interaction,tag=--bbln.new,limit=1,x=0] ^ ^$(height) ^ ~ ~
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,x=0] remove --bbln.new
