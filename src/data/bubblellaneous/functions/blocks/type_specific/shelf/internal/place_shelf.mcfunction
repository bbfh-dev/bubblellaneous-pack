summon interaction ~ ~-0.5 ~ {Tags: ["+bubblellaneous", "local.shelf", "local.base", "--local.new"], response: 1b, width: 0.875f, height: 0.4375f}
scoreboard players set @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block_state 0
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1,sort=nearest] remove --local.new
