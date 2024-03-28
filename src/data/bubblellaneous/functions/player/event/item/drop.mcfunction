scoreboard players reset @s local.player.drop

execute as @s[tag=--local.flashlight.in_use,nbt=!{SelectedItem: {tag: {bubblellaneous: {item_data: {id: "flashlight"}, item_properties: {is_turned_on: 1}}}}}] run tag @s remove --local.flashlight.in_use

tag @s add --local.player
execute as @e[type=item,nbt={Age: 0s, Item: {tag: {bubblellaneous: {is_gui: 1b}}}},distance=..5,limit=1,sort=nearest] run function bubblellaneous:player/event/item/drop/gui_action
tag @s remove --local.player
