execute store result score $Temp1 bubblellaneous run data get entity @s ArmorItems[3].tag.Bubblellaneous.Owner[0]
execute store result score $Temp2 bubblellaneous run data get entity @s ArmorItems[3].tag.Bubblellaneous.Owner[1]
execute store result score $Temp3 bubblellaneous run data get entity @s ArmorItems[3].tag.Bubblellaneous.Owner[2]
execute store result score $Temp4 bubblellaneous run data get entity @s ArmorItems[3].tag.Bubblellaneous.Owner[3]
execute if score $Temp1 bubblellaneous = $Player1 bubblellaneous if score $Temp2 bubblellaneous = $Player2 bubblellaneous if score $Temp3 bubblellaneous = $Player3 bubblellaneous if score $Temp4 bubblellaneous = $Player4 bubblellaneous run scoreboard players add $Temp bubblellaneous 1
execute if score $Temp bubblellaneous = @p[distance=0] buln.trigger run function bubblellaneous:block/cctv_camera/trigger/instance/watch_instance