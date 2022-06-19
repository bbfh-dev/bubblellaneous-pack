scoreboard players set $Temp bubblellaneous 0
execute as @p if entity @s[gamemode=!creative, gamemode=!spectator] run scoreboard players set $Temp bubblellaneous 1
execute if score $Temp bubblellaneous matches 1 run function bubblellaneous:loot/return_instance

execute align xyz run particle minecraft:ash ~.5 ~.5 ~.5 0.2 0.2 0.2 0 50
playsound minecraft:item.trident.hit block @a ~ ~ ~ 0.5