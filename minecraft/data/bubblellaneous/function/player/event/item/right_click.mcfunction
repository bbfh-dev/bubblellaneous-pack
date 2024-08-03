scoreboard players reset @s local.player.right_click

execute if entity @s[nbt={SelectedItem: {id: "minecraft:carrot_on_a_stick"}}] run data modify storage bubblellaneous tmp.event set from entity @s SelectedItem.components.minecraft:custom_data.bubblellaneous
execute unless entity @s[nbt={SelectedItem: {id: "minecraft:carrot_on_a_stick"}}] run data modify storage bubblellaneous tmp.event set from entity @s Inventory[{Slot: -106b}].components.minecraft:custom_data.bubblellaneous

function bubblellaneous:player/event/item/use with storage bubblellaneous tmp.event.item_data
