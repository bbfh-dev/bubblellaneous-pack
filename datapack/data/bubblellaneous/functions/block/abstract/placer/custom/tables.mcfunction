#  Summon
summon armor_stand ~ ~ ~ {Tags:["bubblellaneous", "buln.block", "buln.notset"], ArmorItems:[{},{},{},{id:"minecraft:item_frame", Count:1b}], Invisible:1b, Small:1b, DisabledSlots:4144959, NoGravity:1b, NoBasePlate:1b}
execute store result score $Temp bubblellaneous run data get entity @s Item.tag.CustomModelData
scoreboard players add $Temp bubblellaneous 9
execute store result entity @e[type=armor_stand, tag=buln.block, tag=buln.notset, limit=1] ArmorItems[3].tag.CustomModelData int 1 run scoreboard players get $Temp bubblellaneous


#  Base block
execute if entity @s[tag=-buln.base.top] run setblock ~ ~ ~ petrified_oak_slab[type=top]


#  Sound manager
execute if entity @s[tag=-buln.sound.wood] run playsound minecraft:block.wood.place block @a ~ ~ ~ 1

tag @s add -buln.temp
execute as @e[type=armor_stand, tag=buln.block, tag=buln.notset, limit=1] run function bubblellaneous:block/abstract/placer/single/instance_place
function bubblellaneous:block/abstract/placer/custom/tables/update