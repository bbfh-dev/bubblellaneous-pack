execute at @s run setblock ~ ~ ~ redstone_block
scoreboard players set @s buln.data0 60
data modify entity @s ArmorItems[3].tag.CustomModelData set value 85172
playsound bubblellaneous:block.lock.unlock block @a ~ ~ ~ 1