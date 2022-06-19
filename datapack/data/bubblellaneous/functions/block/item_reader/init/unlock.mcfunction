scoreboard players set $Boolean bubblellaneous 0

execute if data entity @p SelectedItem.id run function bubblellaneous:block/item_reader/init/unlock_main

execute if score $Boolean bubblellaneous matches 0 run function bubblellaneous:block/item_reader/message/wrong_item
execute if score $Boolean bubblellaneous matches 1.. run function bubblellaneous:block/item_reader/unlock