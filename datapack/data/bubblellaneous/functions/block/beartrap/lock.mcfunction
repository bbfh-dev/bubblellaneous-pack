tag @s add -buln.closed
scoreboard players operation @p[distance=...9, tag=!-buln.linked, gamemode=!creative, gamemode=!spectator] buln.data1 = @s buln.registry
tag @p[distance=...9, tag=!-buln.linked, gamemode=!creative, gamemode=!spectator] add -buln.linked
scoreboard players set @s buln.data0 200
data modify entity @s ArmorItems[3].tag.CustomModelData set value 85199
playsound minecraft:block.iron_trapdoor.close block @a ~ ~ ~
playsound bubblellaneous:block.industrial.hit block @a ~ ~ ~