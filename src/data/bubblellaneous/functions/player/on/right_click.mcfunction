scoreboard players reset @s local.on_right_click

data modify storage bubblellaneous tmp.input set from entity @s SelectedItem.tag.item_data
execute if data entity @s SelectedItem.tag.item_data run function bubblellaneous:items/type_specific/carrot_on_a_stick/use with storage bubblellaneous tmp.input
