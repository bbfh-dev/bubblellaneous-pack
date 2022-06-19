execute if score @s buln.registry matches 1.. run function bubblellaneous:player/trigger/instance
execute if entity @s[nbt={SelectedItem:{tag:{CustomModelData:85204}}}] run function bubblellaneous:block/cctv_camera/trigger/instance
scoreboard players reset @s buln.trigger