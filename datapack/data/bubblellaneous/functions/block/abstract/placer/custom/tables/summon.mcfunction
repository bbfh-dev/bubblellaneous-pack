function bubblellaneous:block/abstract/placer/custom/tables/delete
summon armor_stand ~ ~ ~ {Tags:["bubblellaneous", "buln.child", "buln.notset"], ArmorItems:[{},{},{},{id:"minecraft:item_frame", Count:1b}], Invisible:1b, Small:1b, DisabledSlots:4144959, NoGravity:1b, NoBasePlate:1b}
scoreboard players operation @e[type=armor_stand, tag=buln.child, tag=buln.notset, limit=1] buln.registry = @s buln.registry
execute store result score $Temp bubblellaneous run data get entity @s ArmorItems[3].tag.CustomModelData
scoreboard players add $Temp bubblellaneous 9
execute store result entity @e[type=armor_stand, tag=buln.child, tag=buln.notset, limit=1] ArmorItems[3].tag.CustomModelData int 1 run scoreboard players get $Temp bubblellaneous
tag @e[type=armor_stand, tag=buln.child, tag=buln.notset, limit=1] remove buln.notset
scoreboard players set $Updated bubblellaneous 1