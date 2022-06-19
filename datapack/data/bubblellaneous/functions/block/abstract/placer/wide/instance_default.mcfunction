#  Summon
execute if score $Towards bubblellaneous matches 0 run function bubblellaneous:block/abstract/placer/single/instance_default/return
execute if score $Towards bubblellaneous matches 1 run summon armor_stand ~ ~ ~ {Pose:{Head:[0f, -90f, 0f]}, Tags:["bubblellaneous", "buln.block", "buln.notset"], ArmorItems:[{},{},{},{id:"minecraft:item_frame", Count:1b}], Invisible:1b, Small:1b, DisabledSlots:4144959, NoGravity:1b, NoBasePlate:1b}
execute if score $Towards bubblellaneous matches 2 run summon armor_stand ~ ~ ~ {Pose:{Head:[0f, 0.00f, 0f]}, Tags:["bubblellaneous", "buln.block", "buln.notset"], ArmorItems:[{},{},{},{id:"minecraft:item_frame", Count:1b}], Invisible:1b, Small:1b, DisabledSlots:4144959, NoGravity:1b, NoBasePlate:1b}
execute if score $Towards bubblellaneous matches 3 run summon armor_stand ~ ~ ~ {Pose:{Head:[0f, 90.0f, 0f]}, Tags:["bubblellaneous", "buln.block", "buln.notset"], ArmorItems:[{},{},{},{id:"minecraft:item_frame", Count:1b}], Invisible:1b, Small:1b, DisabledSlots:4144959, NoGravity:1b, NoBasePlate:1b}
execute if score $Towards bubblellaneous matches 4 run summon armor_stand ~ ~ ~ {Pose:{Head:[0f, 180f, 0f]}, Tags:["bubblellaneous", "buln.block", "buln.notset"], ArmorItems:[{},{},{},{id:"minecraft:item_frame", Count:1b}], Invisible:1b, Small:1b, DisabledSlots:4144959, NoGravity:1b, NoBasePlate:1b}
data modify entity @e[type=armor_stand, tag=buln.block, tag=buln.notset, limit=1] ArmorItems[3].tag.CustomModelData set from entity @s Item.tag.CustomModelData


#  Base block
execute unless score $Towards bubblellaneous matches 0 run function bubblellaneous:block/abstract/placer/wide/instance_default/instance
execute if score $Towards bubblellaneous matches 1 positioned ~ ~ ~-1 run function bubblellaneous:block/abstract/placer/wide/instance_default/instance
execute if score $Towards bubblellaneous matches 2 positioned ~1 ~ ~ run function bubblellaneous:block/abstract/placer/wide/instance_default/instance
execute if score $Towards bubblellaneous matches 3 positioned ~ ~ ~1 run function bubblellaneous:block/abstract/placer/wide/instance_default/instance
execute if score $Towards bubblellaneous matches 4 positioned ~-1 ~ ~ run function bubblellaneous:block/abstract/placer/wide/instance_default/instance


#  Sound manager
execute unless score $Towards bubblellaneous matches 0 if entity @s[tag=-buln.sound.wood] run playsound minecraft:block.wood.place block @a ~ ~ ~ 1
execute unless score $Towards bubblellaneous matches 0 if entity @s[tag=-buln.sound.wool] run playsound minecraft:block.wool.place block @a ~ ~ ~ 1

tag @s add -buln.temp
execute as @e[type=armor_stand, tag=buln.block, tag=buln.notset, limit=1] run function bubblellaneous:block/abstract/placer/wide/instance_place


#  Additional
execute unless score $Towards bubblellaneous matches 0 run function bubblellaneous:block/abstract/placer/wide/instance_default/additional