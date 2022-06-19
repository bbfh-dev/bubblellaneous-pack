#  Facing
execute if entity @s[tag=-buln.towards.none] run scoreboard players set $Towards bubblellaneous 1
execute if entity @s[tag=-buln.towards.player] run function bubblellaneous:block/abstract/placer/towards/player
execute if entity @s[tag=-buln.towards.floor] run function bubblellaneous:block/abstract/placer/towards/floor
execute if entity @s[tag=-buln.towards.wall] run function bubblellaneous:block/abstract/placer/towards/wall


#  Summon
execute if score $Towards bubblellaneous matches 0 run function bubblellaneous:block/abstract/placer/single/instance_default/return
execute if score $Towards bubblellaneous matches 1 run summon armor_stand ~ ~ ~ {Pose:{Head:[0f, -90f, 0f]}, Tags:["bubblellaneous", "buln.block", "buln.notset"], ArmorItems:[{},{},{},{id:"minecraft:item_frame", Count:1b}], Invisible:1b, Small:1b, DisabledSlots:4144959, NoGravity:1b, NoBasePlate:1b}
execute if score $Towards bubblellaneous matches 2 run summon armor_stand ~ ~ ~ {Pose:{Head:[0f, 0.00f, 0f]}, Tags:["bubblellaneous", "buln.block", "buln.notset"], ArmorItems:[{},{},{},{id:"minecraft:item_frame", Count:1b}], Invisible:1b, Small:1b, DisabledSlots:4144959, NoGravity:1b, NoBasePlate:1b}
execute if score $Towards bubblellaneous matches 3 run summon armor_stand ~ ~ ~ {Pose:{Head:[0f, 90.0f, 0f]}, Tags:["bubblellaneous", "buln.block", "buln.notset"], ArmorItems:[{},{},{},{id:"minecraft:item_frame", Count:1b}], Invisible:1b, Small:1b, DisabledSlots:4144959, NoGravity:1b, NoBasePlate:1b}
execute if score $Towards bubblellaneous matches 4 run summon armor_stand ~ ~ ~ {Pose:{Head:[0f, 180f, 0f]}, Tags:["bubblellaneous", "buln.block", "buln.notset"], ArmorItems:[{},{},{},{id:"minecraft:item_frame", Count:1b}], Invisible:1b, Small:1b, DisabledSlots:4144959, NoGravity:1b, NoBasePlate:1b}
execute unless entity @s[tag=-buln.copy_nbt] run data modify entity @e[type=armor_stand, tag=buln.block, tag=buln.notset, limit=1] ArmorItems[3].tag.CustomModelData set from entity @s Item.tag.CustomModelData
execute if entity @s[tag=-buln.copy_nbt] run function bubblellaneous:block/abstract/placer/single/instance_default/copy_nbt


#  Base block
execute unless score $Towards bubblellaneous matches 0 run function bubblellaneous:block/abstract/placer/single/instance_default/instance


#  Sound manager
execute unless score $Towards bubblellaneous matches 0 run function bubblellaneous:block/abstract/placer/single/instance_default/sound

tag @s add -buln.temp
execute as @e[type=armor_stand, tag=buln.block, tag=buln.notset, limit=1] run function bubblellaneous:block/abstract/placer/single/instance_place


#  Additional
execute unless score $Towards bubblellaneous matches 0 run function bubblellaneous:block/abstract/placer/single/instance_default/additional