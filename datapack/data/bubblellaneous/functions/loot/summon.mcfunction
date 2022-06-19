execute store result score $Temp bubblellaneous run data get entity @s ArmorItems[3].tag.CustomModelData
execute if score $Temp bubblellaneous matches 85002..85500 run function bubblellaneous:loot/summon/low
execute if score $Temp bubblellaneous matches 85501..86000 run function bubblellaneous:loot/summon/high