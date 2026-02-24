#region Screen
summon text_display ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.keypad.screen", "--bbln.new"], width: 1f, height: 1f, text: {"text":"", "color":"gray",extra:[{translate:"ui.bubblellaneous.keypad_lock.x"},{translate:"ui.bubblellaneous.keypad_lock.x"},{translate:"ui.bubblellaneous.keypad_lock.x"},{translate:"ui.bubblellaneous.keypad_lock.x"}]}, shadow: 1b, background: 0, brightness: {sky: 15, block: 15}}
execute align xyz positioned ~0.5 ~ ~0.5 run tp @e[type=text_display,tag=--bbln.new,limit=1,x=0] ^-0.0125 ^0.625 ^0.51 ~ ~
scoreboard players operation @e[type=text_display,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=text_display,tag=--bbln.new,limit=1,x=0] remove --bbln.new

#region Button 1
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.keypad.button", "--bbln.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~0.5 ~ ~0.5 run tp @e[type=interaction,tag=--bbln.new,limit=1,x=0] ^-0.2814 ^0.4365 ^0.41 ~ ~
scoreboard players set @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.model 1
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,x=0] remove --bbln.new
#endregion

#region Button 2
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.keypad.button", "--bbln.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~0.5 ~ ~0.5 run tp @e[type=interaction,tag=--bbln.new,limit=1,x=0] ^-0.0938 ^0.4365 ^0.41 ~ ~
scoreboard players set @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.model 2
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,x=0] remove --bbln.new
#endregion

#region Button 3
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.keypad.button", "--bbln.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~0.5 ~ ~0.5 run tp @e[type=interaction,tag=--bbln.new,limit=1,x=0] ^0.0938 ^0.4365 ^0.41 ~ ~
scoreboard players set @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.model 3
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,x=0] remove --bbln.new
#endregion

#region Button 4
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.keypad.button", "--bbln.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~0.5 ~ ~0.5 run tp @e[type=interaction,tag=--bbln.new,limit=1,x=0] ^0.2814 ^0.4365 ^0.41 ~ ~
scoreboard players set @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.model 4
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,x=0] remove --bbln.new
#endregion

#region Button 5
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.keypad.button", "--bbln.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~0.5 ~ ~0.5 run tp @e[type=interaction,tag=--bbln.new,limit=1,x=0] ^-0.2814 ^0.2489 ^0.41 ~ ~
scoreboard players set @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.model 5
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,x=0] remove --bbln.new
#endregion

#region Button 6
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.keypad.button", "--bbln.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~0.5 ~ ~0.5 run tp @e[type=interaction,tag=--bbln.new,limit=1,x=0] ^-0.0938 ^0.2489 ^0.41 ~ ~
scoreboard players set @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.model 6
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,x=0] remove --bbln.new
#endregion

#region Button 7
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.keypad.button", "--bbln.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~0.5 ~ ~0.5 run tp @e[type=interaction,tag=--bbln.new,limit=1,x=0] ^0.0938 ^0.2489 ^0.41 ~ ~
scoreboard players set @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.model 7
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,x=0] remove --bbln.new
#endregion

#region Button 8
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.keypad.button", "--bbln.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~0.5 ~ ~0.5 run tp @e[type=interaction,tag=--bbln.new,limit=1,x=0] ^0.2814 ^0.2489 ^0.41 ~ ~
scoreboard players set @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.model 8
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,x=0] remove --bbln.new
#endregion

#region Button 9
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.keypad.button", "--bbln.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~0.5 ~ ~0.5 run tp @e[type=interaction,tag=--bbln.new,limit=1,x=0] ^-0.0938 ^0.0613 ^0.41 ~ ~
scoreboard players set @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.model 9
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,x=0] remove --bbln.new
#endregion

#region Button 0
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.keypad.button", "--bbln.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~0.5 ~ ~0.5 run tp @e[type=interaction,tag=--bbln.new,limit=1,x=0] ^0.0938 ^0.0613 ^0.41 ~ ~
scoreboard players set @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.model 0
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,x=0] remove --bbln.new
#endregion

#region Button enter
summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.keypad.enter", "--bbln.new"], width: 0.1875f, height: 0.1875f, response: 1b}
execute align xyz positioned ~0.5 ~ ~0.5 run tp @e[type=interaction,tag=--bbln.new,limit=1,x=0] ^0.2814 ^0.0613 ^0.41 ~ ~
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,x=0] remove --bbln.new
#endregion
