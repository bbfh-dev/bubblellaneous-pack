tag @s add --local.item
execute as @s[nbt={Item: {components: {"minecraft:custom_data": {bubblellaneous: {item_data: {id: "flashlight"}}}}}}] run data modify entity @s Item.components."minecraft:custom_data".bubblellaneous.item_properties.is_turned_on set value 0
