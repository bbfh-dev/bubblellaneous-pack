summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.base.electrical_box", "local.base", "--local.new"], width: 0.625f, height: 0.75f, response: 1b}
execute align xyz positioned ~.5 ~ ~.5 run tp @e[type=interaction,tag=--local.new,limit=1,sort=nearest] ^ ^0.125 ^-0.5625 ~ ~
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1,sort=nearest] remove --local.new
