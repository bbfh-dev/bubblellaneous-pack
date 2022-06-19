summon armor_stand ~ ~ ~ {Tags:["buln.stand"], ArmorItems:[{},{},{},{id:"minecraft:stone", Count:1b}]}
data modify entity @e[type=armor_stand, tag=buln.stand, limit=1] ArmorItems[3].tag.CustomModelData set from entity @s Item.tag.CustomModelData
execute as @e[type=armor_stand, tag=buln.stand, limit=1] run function bubblellaneous:loot/summon
kill @e[type=armor_stand, tag=buln.stand, limit=1]