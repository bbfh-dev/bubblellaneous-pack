summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.curtains", "--local.new"], response: 1b, width: 1f, height: 1f}
execute align xyz positioned ~.5 ~ ~.5 run tp @e[type=interaction,tag=--local.new,limit=1,sort=nearest] ^ ^ ^-0.45 ~ ~
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1,sort=nearest] remove --local.new

function bubblellaneous:block/curtains/internal/neighbors/close
tag @e[type=item_display] remove --local.cached
