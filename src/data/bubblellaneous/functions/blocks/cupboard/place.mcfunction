#region Bottom
summon interaction ^ ^ ^ {Tags: ["+bubblellaneous", "local.item_holder", "--local.new"], width: 0.875f, height: 0.4375f, response: 1b}

execute as @e[type=interaction,tag=--local.new,limit=1] run tp @s ^ ^.0625 ^0.065 ~ ~
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1] remove --local.new
#endregion

#region Top
summon interaction ^ ^ ^ {Tags: ["+bubblellaneous", "local.item_holder", "--local.new"], width: 0.875f, height: 0.375f, response: 1b}

execute as @e[type=interaction,tag=--local.new,limit=1] run tp @s ^ ^.5625 ^0.065 ~ ~
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1] remove --local.new
#endregion
