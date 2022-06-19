scoreboard players set $Temp bubblellaneous 0
execute if entity @p[nbt={SelectedItem:{tag:{CustomModelData:85195}}}, distance=0] run scoreboard players set $Temp bubblellaneous 1
execute if entity @p[nbt={SelectedItem:{tag:{CustomModelData:85196}}}, distance=0] run scoreboard players set $Temp bubblellaneous 2
execute if entity @p[nbt={SelectedItem:{tag:{CustomModelData:85197}}}, distance=0] run scoreboard players set $Temp bubblellaneous 3
execute if entity @p[nbt={SelectedItem:{tag:{CustomModelData:85198}}}, distance=0] run scoreboard players set $Temp bubblellaneous 4
execute unless score @s buln.data0 = $Temp bubblellaneous run tellraw @p {"translate":"msg.bubblellaneous.wrong_key", "color":"red"}
execute if score @s buln.data0 = $Temp bubblellaneous run function bubblellaneous:block/padlock_door/lock/unlock