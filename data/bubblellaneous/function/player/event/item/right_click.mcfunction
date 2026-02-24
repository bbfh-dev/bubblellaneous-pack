scoreboard players reset @s bbln.player.right_click
execute unless items entity @s weapon.* minecraft:carrot_on_a_stick[custom_data~{bubblellaneous:{}}] run return 0

execute if items entity @s weapon.mainhand minecraft:carrot_on_a_stick run data modify storage bubblellaneous tmp.event set from entity @s SelectedItem.components.minecraft:custom_data.bubblellaneous
execute unless items entity @s weapon.mainhand minecraft:carrot_on_a_stick run data modify storage bubblellaneous tmp.event set from entity @s equipment.offhand.components.minecraft:custom_data.bubblellaneous

function bubblellaneous:player/event/item/use with storage bubblellaneous tmp.event.item_data
