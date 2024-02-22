summon interaction ~ ~-0.01 ~ {Tags: ["+bubblellaneous", "local.padlock", "--local.base", "--local.new"], width: 1.02f, height: 2.02f, response: 1b}

scoreboard players operation @e[type=interaction,tag=--local.new,limit=1] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1] remove --local.new

execute if block ~ ~ ~ #doors[hinge=right] run function bubblellaneous:blocks/padlock_block/blockstate/set_left
execute if block ~ ~ ~ #doors[hinge=left] run function bubblellaneous:blocks/padlock_block/blockstate/set_right
