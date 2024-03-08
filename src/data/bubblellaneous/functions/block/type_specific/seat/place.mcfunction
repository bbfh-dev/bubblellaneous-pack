$summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.seat", "--local.new"], response: 1b, width: $(width)f, height: 0.02f}
$execute align xyz positioned ~.5 ~ ~.5 run tp @e[type=interaction,tag=--local.new,limit=1,sort=nearest] ^ ^$(height) ^ ~ ~
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1,sort=nearest] remove --local.new
