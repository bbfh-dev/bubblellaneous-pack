execute unless entity @s[nbt={SelectedItem: {id: "minecraft:carrot_on_a_stick"}}] run return 0
execute store result score is_turned_on local.tmp run data get entity @s SelectedItem.components.minecraft:custom_data.bubblellaneous.item_properties.is_turned_on
execute if score is_turned_on local.tmp matches 0 run function bubblellaneous:item/flashlight/enable
execute if score is_turned_on local.tmp matches 1 run function bubblellaneous:item/flashlight/disable
