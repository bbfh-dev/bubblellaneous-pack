setblock ~ ~ ~ light[level=15]

summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "--local.base", "--local.new"], width: 1f, height: 1f, response: 1b}

scoreboard players operation @e[type=interaction,tag=--local.new,limit=1] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1] remove --local.new
