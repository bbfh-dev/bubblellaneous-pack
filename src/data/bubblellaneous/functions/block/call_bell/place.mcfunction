summon interaction ~ ~-0.5 ~ {Tags: ["+bubblellaneous", "local.bell", "local.base", "--local.new"], width: 0.375f, height: 0.25f, response: 1b}
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1,sort=nearest] remove --local.new
