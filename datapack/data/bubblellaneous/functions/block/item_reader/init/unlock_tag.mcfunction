data modify storage minecraft:temp value set from entity @s ArmorItems[3].tag.Bubblellaneous.Lock.tag
execute store success score $Temp bubblellaneous run data modify storage minecraft:temp value set from entity @p SelectedItem.tag
execute if score $Temp bubblellaneous matches 0 run scoreboard players add $Boolean bubblellaneous 1
execute unless data entity @p SelectedItem.tag run scoreboard players set $Boolean bubblellaneous 0