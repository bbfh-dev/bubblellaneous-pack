summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.trashcan", "--local.new"], width: 0.5f, height: 0.9f, response: 1b}

scoreboard players operation @e[type=interaction,tag=--local.new,limit=1] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1] remove --local.new
