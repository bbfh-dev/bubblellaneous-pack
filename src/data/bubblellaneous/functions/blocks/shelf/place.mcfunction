summon interaction ~ ~.5 ~ {Tags: ["+bubblellaneous", "local.item_holder", "--local.new"], width: 0.95f, height: 0.1f, response: 1b}

execute as @e[type=interaction,tag=--local.new,limit=1] run tp @s ~ ~.5 ~ ~ ~
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1] remove --local.new
