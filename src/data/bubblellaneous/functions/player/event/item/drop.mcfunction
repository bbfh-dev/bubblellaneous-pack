scoreboard players reset @s local.player.drop

execute as @s[tag=--local.flashlight.in_use,nbt=!{SelectedItem: {tag: {bubblellaneous: {item_data: {id: "flashlight"}, item_properties: {is_turned_on: 1}}}}}] run tag @s remove --local.flashlight.in_use
