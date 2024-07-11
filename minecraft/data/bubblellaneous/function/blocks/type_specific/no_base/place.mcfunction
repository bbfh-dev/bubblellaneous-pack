$summon interaction ~ ~-0.51 ~ {Tags: ["+bubblellaneous", "local.base", "local.base.$(name)", "--local.new"], width: 1.01f, height: 1.02f, response: 1b}

scoreboard players operation @e[type=interaction,tag=--local.new,limit=1] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1] remove --local.new
