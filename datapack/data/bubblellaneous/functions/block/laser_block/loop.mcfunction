scoreboard players remove $Limit bubblellaneous 1
particle dust 0.953 0.208 0.208 0.8 ~ ~ ~ 0.2 0.2 0.2 0.1 1 force @a[tag=-buln.equip.nanoglass]
execute if entity @p[distance=...9, gamemode=!spectator, gamemode=!creative] run scoreboard players set $Temp bubblellaneous 1
execute positioned ~ ~-1 ~ if entity @p[distance=...9, gamemode=!spectator, gamemode=!creative] run scoreboard players set $Temp bubblellaneous 1
execute if score $Limit bubblellaneous matches 1.. positioned ^ ^ ^1 if block ~ ~ ~ #bubblellaneous:air run function bubblellaneous:block/laser_block/loop