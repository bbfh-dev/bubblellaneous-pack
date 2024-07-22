advancement revoke @s only bubblellaneous:player/event/item/nanoglasses/inventory_changed

tag @s remove --local.nanoglasses.using
execute if entity @s[nbt={Inventory: [{Slot: 103b, components: {"minecraft:custom_data": {bubblellaneous: {item_data: {id: "nanoglasses"}}}}}]}] run tag @s add --local.nanoglasses.using
