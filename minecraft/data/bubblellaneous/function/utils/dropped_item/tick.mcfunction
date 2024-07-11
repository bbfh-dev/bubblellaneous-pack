tag @s add --local.item
execute as @s[nbt={Item: {tag: {bubblellaneous: {item_data: {id: "flashlight"}}}}}] run data modify entity @s Item.tag.bubblellaneous.item_properties.is_turned_on set value 0
