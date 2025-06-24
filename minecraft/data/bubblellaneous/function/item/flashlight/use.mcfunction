execute unless entity @s[nbt={SelectedItem: {id: "minecraft:carrot_on_a_stick"}}] unless entity @s[nbt={equipment: {offhand: {id: "minecraft:carrot_on_a_stick"}}}] run return 0
execute if entity @s[nbt={SelectedItem: {id: "minecraft:carrot_on_a_stick"}}] store result score is_turned_on local.tmp run data get entity @s SelectedItem.components.minecraft:custom_data.bubblellaneous.item_properties.is_turned_on
execute if entity @s[nbt={equipment: {offhand: {id: "minecraft:carrot_on_a_stick"}}}] store result score is_turned_on local.tmp run data get entity @s equipment.offhand.components.minecraft:custom_data.bubblellaneous.item_properties.is_turned_on

execute if score is_turned_on local.tmp matches 0 run function bubblellaneous:item/flashlight/enable
execute if score is_turned_on local.tmp matches 1 run function bubblellaneous:item/flashlight/disable
