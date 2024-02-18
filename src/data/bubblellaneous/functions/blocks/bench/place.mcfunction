summon interaction ^ ^.6 ^-0.15 {Tags: ["+bubblellaneous", "local.seat", "--local.new"], width: 0.8f, height: 0.1f, response: 1b}

execute as @e[type=interaction,tag=--local.new,limit=1] run tp @s ^ ^.6 ^-0.15 ~ ~
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1] remove --local.new
