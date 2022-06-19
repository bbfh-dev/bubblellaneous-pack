execute store success score $Temp bubblellaneous run clear @p item_frame{Bubblellaneous:{action:"item"}} 0
execute if score $Temp bubblellaneous matches 1 if entity @p[distance=0, nbt={Inventory:[{tag:{Bubblellaneous:{pack:1b}}}]}] run function bubblellaneous:block/bubble_bench/interaction/click

execute store success score $Temp bubblellaneous run clear @p item_frame{Bubblellaneous:{action:"controller.furniture"}} 0
execute if score $Temp bubblellaneous matches 1 run scoreboard players set @s buln.data0 0
execute if score $Temp bubblellaneous matches 1 run scoreboard players set @s buln.data1 1
execute if score $Temp bubblellaneous matches 1 run playsound bubblellaneous:block.industrial.hit block @p ~ ~ ~ 1

execute store success score $Temp bubblellaneous run clear @p item_frame{Bubblellaneous:{action:"controller.security"}} 0
execute if score $Temp bubblellaneous matches 1 run scoreboard players set @s buln.data0 1
execute if score $Temp bubblellaneous matches 1 run scoreboard players set @s buln.data1 1
execute if score $Temp bubblellaneous matches 1 run playsound bubblellaneous:block.industrial.hit block @p ~ ~ ~ 1

execute store success score $Temp bubblellaneous run clear @p item_frame{Bubblellaneous:{action:"controller.miscellaneous"}} 0
execute if score $Temp bubblellaneous matches 1 run scoreboard players set @s buln.data0 2
execute if score $Temp bubblellaneous matches 1 run scoreboard players set @s buln.data1 1
execute if score $Temp bubblellaneous matches 1 run playsound bubblellaneous:block.industrial.hit block @p ~ ~ ~ 1

execute store success score $Temp bubblellaneous run clear @p item_frame{Bubblellaneous:{action:"controller.food"}} 0
execute if score $Temp bubblellaneous matches 1 run scoreboard players set @s buln.data0 3
execute if score $Temp bubblellaneous matches 1 run scoreboard players set @s buln.data1 1
execute if score $Temp bubblellaneous matches 1 run playsound bubblellaneous:block.industrial.hit block @p ~ ~ ~ 1

execute store success score $Temp bubblellaneous run clear @p item_frame{Bubblellaneous:{action:"gui.previous"}} 0
execute if score $Temp bubblellaneous matches 1 run scoreboard players remove @s buln.data1 1
execute if score $Temp bubblellaneous matches 1 run playsound bubblellaneous:block.industrial.hit block @p ~ ~ ~ 1

execute store success score $Temp bubblellaneous run clear @p item_frame{Bubblellaneous:{action:"gui.next"}} 0
execute if score $Temp bubblellaneous matches 1 run scoreboard players add @s buln.data1 1
execute if score $Temp bubblellaneous matches 1 run playsound bubblellaneous:block.industrial.hit block @p ~ ~ ~ 1

execute if score @s buln.data1 matches ..0 run scoreboard players set @s buln.data1 1


#  Finish
execute at @s run function #bubblellaneous:block/bubble_bench/update
clear @p item_frame{Bubblellaneous:{pack:1b}}