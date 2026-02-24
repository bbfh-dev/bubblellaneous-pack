scoreboard players operation #id_test bbln.tmp = @s bbln.block.id
tag @e[type=text_display,tag=bbln.keypad.screen,predicate=bubblellaneous:check/block.id,limit=1,x=0] add --bbln.this

execute store result score #pincode bbln.tmp run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.pincode

execute if score @s bbln.block_state matches 0 as @e[type=text_display,tag=bbln.keypad.screen,tag=--bbln.this,limit=1,x=0] run data modify entity @s text set value {text:"","color":"gray",extra:[{translate:"ui.bubblellaneous.keypad_lock.x"},{translate:"ui.bubblellaneous.keypad_lock.x"},{translate:"ui.bubblellaneous.keypad_lock.x"},{translate:"ui.bubblellaneous.keypad_lock.x"}]}

execute if score @s bbln.block_state matches 1 as @e[type=text_display,tag=bbln.keypad.screen,tag=--bbln.this,limit=1,x=0] run data modify entity @s text set value ["", {"text":"", "color":"gray",extra:[{translate:"ui.bubblellaneous.keypad_lock.x"},{translate:"ui.bubblellaneous.keypad_lock.x"},{translate:"ui.bubblellaneous.keypad_lock.x"}]}, {"score":{"name":"#pincode", "objective":"bbln.tmp"}}]

execute if score @s bbln.block_state matches 2 as @e[type=text_display,tag=bbln.keypad.screen,tag=--bbln.this,limit=1,x=0] if score #pincode bbln.tmp matches 10.. run data modify entity @s text set value ["", {"text":"", "color":"gray",extra:[{translate:"ui.bubblellaneous.keypad_lock.x"},{translate:"ui.bubblellaneous.keypad_lock.x"}]}, {"score":{"name":"#pincode", "objective":"bbln.tmp"}}]
execute if score @s bbln.block_state matches 2 as @e[type=text_display,tag=bbln.keypad.screen,tag=--bbln.this,limit=1,x=0] unless score #pincode bbln.tmp matches 10.. run data modify entity @s text set value ["", {"text":"", "color":"gray",extra:[{translate:"ui.bubblellaneous.keypad_lock.x"},{translate:"ui.bubblellaneous.keypad_lock.x"}]}, "0", {"score":{"name":"#pincode", "objective":"bbln.tmp"}}]

execute if score @s bbln.block_state matches 3 as @e[type=text_display,tag=bbln.keypad.screen,tag=--bbln.this,limit=1,x=0] if score #pincode bbln.tmp matches 100.. run data modify entity @s text set value ["", {"text":"", "color":"gray",extra:[{translate:"ui.bubblellaneous.keypad_lock.x"}]}, {"score":{"name":"#pincode", "objective":"bbln.tmp"}}]
execute if score @s bbln.block_state matches 3 as @e[type=text_display,tag=bbln.keypad.screen,tag=--bbln.this,limit=1,x=0] if score #pincode bbln.tmp matches ..9 run data modify entity @s text set value ["", {"text":"", "color":"gray",extra:[{translate:"ui.bubblellaneous.keypad_lock.x"}]}, "00", {"score":{"name":"#pincode", "objective":"bbln.tmp"}}]
execute if score @s bbln.block_state matches 3 as @e[type=text_display,tag=bbln.keypad.screen,tag=--bbln.this,limit=1,x=0] if score #pincode bbln.tmp matches 10..99 run data modify entity @s text set value ["", {"text":"", "color":"gray",extra:[{translate:"ui.bubblellaneous.keypad_lock.x"}]}, "0", {"score":{"name":"#pincode", "objective":"bbln.tmp"}}]

execute if score @s bbln.block_state matches 4 as @e[type=text_display,tag=bbln.keypad.screen,tag=--bbln.this,limit=1,x=0] if score #pincode bbln.tmp matches 1000.. run data modify entity @s text set value [{"score":{"name":"#pincode", "objective":"bbln.tmp"}}]
execute if score @s bbln.block_state matches 4 as @e[type=text_display,tag=bbln.keypad.screen,tag=--bbln.this,limit=1,x=0] if score #pincode bbln.tmp matches 100..999 run data modify entity @s text set value ["0", {"score":{"name":"#pincode", "objective":"bbln.tmp"}}]
execute if score @s bbln.block_state matches 4 as @e[type=text_display,tag=bbln.keypad.screen,tag=--bbln.this,limit=1,x=0] if score #pincode bbln.tmp matches 10..99 run data modify entity @s text set value ["00", {"score":{"name":"#pincode", "objective":"bbln.tmp"}}]
execute if score @s bbln.block_state matches 4 as @e[type=text_display,tag=bbln.keypad.screen,tag=--bbln.this,limit=1,x=0] if score #pincode bbln.tmp matches ..9 run data modify entity @s text set value ["000", {"score":{"name":"#pincode", "objective":"bbln.tmp"}}]

tag @e[type=text_display,tag=bbln.keypad.screen,tag=--bbln.this,limit=1,x=0] remove --bbln.this