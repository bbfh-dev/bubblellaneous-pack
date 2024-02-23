summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.curtains", "--local.new"], width: 0.7f, height: 1f, response: 1b}

execute as @e[type=interaction,tag=--local.new,limit=1] run tp @s ^ ^ ^-0.6 ~ ~
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1] remove --local.new

function bubblellaneous:blocks/curtains/close_all
tag @e[type=item_display] remove --local.cached
