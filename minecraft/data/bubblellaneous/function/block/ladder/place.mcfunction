summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.ladder", "local.base", "--local.new"], width: 0.95f, height: 0.95f, response: 1b}
execute align xyz positioned ~.5 ~ ~.5 run tp @e[type=interaction,tag=--local.new,limit=1,sort=nearest] ^ ^ ^-0.6875 ~ ~
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1,sort=nearest] remove --local.new

function bubblellaneous:block/curtains/internal/neighbors/close
tag @e[type=item_display] remove --local.cached
