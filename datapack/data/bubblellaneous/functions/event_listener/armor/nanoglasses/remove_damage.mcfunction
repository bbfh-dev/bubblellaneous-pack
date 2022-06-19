execute store result score $Temp bubblellaneous run data get entity @s Inventory[{Slot:103b}].tag.Damage
scoreboard players add $Temp bubblellaneous 1
execute store result storage minecraft:temp value int 1 run scoreboard players get $Temp bubblellaneous
item modify entity @s armor.head bubblellaneous:armor/nanoglasses/set_damage
execute if score $Temp bubblellaneous matches 100.. run item modify entity @s armor.head bubblellaneous:armor/nanoglasses/remove