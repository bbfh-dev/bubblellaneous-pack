summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.base.sink", "local.base", "--local.new"], width: 0.875f, height: 0.4375f, response: 1b}
execute align xyz positioned ~.5 ~ ~.5 run tp @e[type=interaction,tag=--local.new,limit=1,sort=nearest] ^ ^0.61 ^0.0625 ~ ~
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1,sort=nearest] remove --local.new
