#region Screen
summon text_display ~ ~ ~ {Tags: ["+bubblellaneous", "local.keypad.screen", "--local.new"], width: 1f, height: 1f, text: {"text":"××××", "color":"gray"}, shadow: 1b, background: 0, brightness: {sky: 15, block: 15}}
execute align xyz positioned ~.5 ~ ~.5 run tp @e[type=text_display,tag=--local.new,limit=1,sort=nearest] ^-0.015 ^0.5938 ^0.51 ~ ~
scoreboard players operation @e[type=text_display,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=text_display,tag=--local.new,limit=1,sort=nearest] remove --local.new

#region Button 1
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.keypad.button", "--local.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~.5 ~ ~.5 run tp @e[type=interaction,tag=--local.new,limit=1,sort=nearest] ^-0.2814 ^0.4365 ^0.41 ~ ~
scoreboard players set @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.model 1
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1,sort=nearest] remove --local.new
#endregion

#region Button 2
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.keypad.button", "--local.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~.5 ~ ~.5 run tp @e[type=interaction,tag=--local.new,limit=1,sort=nearest] ^-0.0938 ^0.4365 ^0.41 ~ ~
scoreboard players set @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.model 2
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1,sort=nearest] remove --local.new
#endregion

#region Button 3
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.keypad.button", "--local.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~.5 ~ ~.5 run tp @e[type=interaction,tag=--local.new,limit=1,sort=nearest] ^0.0938 ^0.4365 ^0.41 ~ ~
scoreboard players set @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.model 3
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1,sort=nearest] remove --local.new
#endregion

#region Button 4
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.keypad.button", "--local.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~.5 ~ ~.5 run tp @e[type=interaction,tag=--local.new,limit=1,sort=nearest] ^0.2814 ^0.4365 ^0.41 ~ ~
scoreboard players set @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.model 4
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1,sort=nearest] remove --local.new
#endregion

#region Button 5
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.keypad.button", "--local.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~.5 ~ ~.5 run tp @e[type=interaction,tag=--local.new,limit=1,sort=nearest] ^-0.2814 ^0.2489 ^0.41 ~ ~
scoreboard players set @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.model 5
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1,sort=nearest] remove --local.new
#endregion

#region Button 6
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.keypad.button", "--local.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~.5 ~ ~.5 run tp @e[type=interaction,tag=--local.new,limit=1,sort=nearest] ^-0.0938 ^0.2489 ^0.41 ~ ~
scoreboard players set @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.model 6
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1,sort=nearest] remove --local.new
#endregion

#region Button 7
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.keypad.button", "--local.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~.5 ~ ~.5 run tp @e[type=interaction,tag=--local.new,limit=1,sort=nearest] ^0.0938 ^0.2489 ^0.41 ~ ~
scoreboard players set @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.model 7
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1,sort=nearest] remove --local.new
#endregion

#region Button 8
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.keypad.button", "--local.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~.5 ~ ~.5 run tp @e[type=interaction,tag=--local.new,limit=1,sort=nearest] ^0.2814 ^0.2489 ^0.41 ~ ~
scoreboard players set @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.model 8
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1,sort=nearest] remove --local.new
#endregion

#region Button 9
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.keypad.button", "--local.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~.5 ~ ~.5 run tp @e[type=interaction,tag=--local.new,limit=1,sort=nearest] ^-0.0938 ^0.0613 ^0.41 ~ ~
scoreboard players set @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.model 9
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1,sort=nearest] remove --local.new
#endregion

#region Button 0
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.keypad.button", "--local.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~.5 ~ ~.5 run tp @e[type=interaction,tag=--local.new,limit=1,sort=nearest] ^0.0938 ^0.0613 ^0.41 ~ ~
scoreboard players set @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.model 0
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1,sort=nearest] remove --local.new
#endregion

#region Button enter
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.keypad.enter", "--local.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~.5 ~ ~.5 run tp @e[type=interaction,tag=--local.new,limit=1,sort=nearest] ^0.2814 ^0.0613 ^0.41 ~ ~
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1,sort=nearest] remove --local.new
#endregion
