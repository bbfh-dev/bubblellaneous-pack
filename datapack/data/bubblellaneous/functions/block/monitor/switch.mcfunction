scoreboard players add @s buln.data0 1
execute if score @s buln.data0 matches 3.. run scoreboard players set @s buln.data0 0

execute if score @s buln.data0 matches 0 run data modify entity @s ArmorItems[3].tag.CustomModelData set value 85218
execute if score @s buln.data0 matches 1 run data modify entity @s ArmorItems[3].tag.CustomModelData set value 85219
execute if score @s buln.data0 matches 2 run data modify entity @s ArmorItems[3].tag.CustomModelData set value 85224
tag @p add -buln.delay
schedule function bubblellaneous:misc/remove_delay 5t replace