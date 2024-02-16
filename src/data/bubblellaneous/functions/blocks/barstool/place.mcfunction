summon interaction ~ ~.7 ~ {Tags: ["+bubblellaneous", "local.seat", "--local.new"], width: 0.5f, height: 0.1f, response: 1b}

execute as @e[type=interaction,tag=--local.new,limit=1] run tp @s ~ ~.7 ~ ~ ~
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1] remove --local.new
