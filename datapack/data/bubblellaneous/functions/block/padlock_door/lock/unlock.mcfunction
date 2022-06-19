execute at @s run fill ~ ~ ~ ~ ~1 ~ air
execute store result score $Temp bubblellaneous run data get entity @s ArmorItems[3].tag.CustomModelData
execute if score $Temp bubblellaneous matches 85185 run function bubblellaneous:block/padlock_door/lock/unlock/acacia
execute if score $Temp bubblellaneous matches 85186 run function bubblellaneous:block/padlock_door/lock/unlock/birch
execute if score $Temp bubblellaneous matches 85187 run function bubblellaneous:block/padlock_door/lock/unlock/crimson
execute if score $Temp bubblellaneous matches 85188 run function bubblellaneous:block/padlock_door/lock/unlock/dark_oak
execute if score $Temp bubblellaneous matches 85189 run function bubblellaneous:block/padlock_door/lock/unlock/iron
execute if score $Temp bubblellaneous matches 85190 run function bubblellaneous:block/padlock_door/lock/unlock/jungle
execute if score $Temp bubblellaneous matches 85191 run function bubblellaneous:block/padlock_door/lock/unlock/oak
execute if score $Temp bubblellaneous matches 85192 run function bubblellaneous:block/padlock_door/lock/unlock/spruce
execute if score $Temp bubblellaneous matches 85193 run function bubblellaneous:block/padlock_door/lock/unlock/warped
playsound bubblellaneous:block.lock.unlock block @a ~ ~ ~ 1
kill @s