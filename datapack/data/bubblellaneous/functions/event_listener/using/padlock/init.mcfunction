execute as @s[gamemode=!creative] unless entity @s[nbt={SelectedItem:{tag:{CustomModelData:85194}}}] run item modify entity @s weapon.offhand bubblellaneous:armor/nanoglasses/remove
execute as @s[gamemode=!creative] if entity @s[nbt={SelectedItem:{tag:{CustomModelData:85194}}}] run item modify entity @s weapon.mainhand bubblellaneous:armor/nanoglasses/remove
scoreboard players set $Temp bubblellaneous 1
execute if block ~ ~ ~ #doors[half=upper] positioned ~ ~-1 ~ align xyz positioned ~.5 ~ ~.5 run function bubblellaneous:event_listener/using/padlock/instance
execute if block ~ ~ ~ #doors[half=lower] align xyz positioned ~.5 ~ ~.5 run function bubblellaneous:event_listener/using/padlock/instance