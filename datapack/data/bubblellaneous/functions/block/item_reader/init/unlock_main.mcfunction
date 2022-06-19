data modify storage minecraft:temp value set from entity @s ArmorItems[3].tag.Bubblellaneous.Lock.id
execute store success score $Temp bubblellaneous run data modify storage minecraft:temp value set from entity @p SelectedItem.id
execute if score $Temp bubblellaneous matches 0 run scoreboard players add $Boolean bubblellaneous 1

execute if data entity @s ArmorItems[3].tag.Bubblellaneous.Lock.tag run function bubblellaneous:block/item_reader/init/unlock_tag