execute if entity @p[nbt={SelectedItem:{tag:{CustomModelData:85195}}}, distance=0] run scoreboard players set @s buln.data0 1
execute if entity @p[nbt={SelectedItem:{tag:{CustomModelData:85196}}}, distance=0] run scoreboard players set @s buln.data0 2
execute if entity @p[nbt={SelectedItem:{tag:{CustomModelData:85197}}}, distance=0] run scoreboard players set @s buln.data0 3
execute if entity @p[nbt={SelectedItem:{tag:{CustomModelData:85198}}}, distance=0] run scoreboard players set @s buln.data0 4
tellraw @p {"translate":"msg.bubblellaneous.registered", "color":"green", "with":[{"translate":"item.bubblellaneous.padlock"}]}
execute at @s run particle minecraft:instant_effect ~ ~1 ~ 0.3 0.4 0.3 0.1 10
playsound minecraft:block.iron_door.close block @a ~ ~ ~ 1