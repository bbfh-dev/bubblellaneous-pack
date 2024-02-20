summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.ladder", "--local.base", "--local.new"], width: 0.95f, height: 0.95f, response: 1b}

execute as @e[type=interaction,tag=--local.new,limit=1] run tp @s ^ ^ ^-0.6875 ~ ~
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1] remove --local.new
