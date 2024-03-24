advancement revoke @s only bubblellaneous:player/event/item/flashlight/inventory_changed

execute as @s[nbt=!{SelectedItem: {tag: {bubblellaneous: {item_data: {id: "flashlight"}, item_properties: {is_turned_on: 1}}}}}] run tag @s remove --local.flashlight.in_use
