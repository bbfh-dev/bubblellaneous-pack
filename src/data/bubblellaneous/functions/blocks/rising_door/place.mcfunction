summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.rising_door", "--local.base", "--local.new"], width: 1f, height: 1f, response: 1b}

execute as @e[type=interaction,tag=--local.new,limit=1] run tp @s ^ ^ ^ ~ ~
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1] remove --local.new

execute store result score rotation local.tmp run data get storage bubblellaneous tmp.rotation
function bubblellaneous:blocks/rising_door/place_bars
