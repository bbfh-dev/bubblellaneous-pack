scoreboard players set @s local.block.state 1

execute unless score is_playing local.tmp matches 1 run playsound block.iron_trapdoor.open block @a ~ ~ ~ 1 1 0

scoreboard players set is_playing local.tmp 1
execute positioned ~ ~-1 ~ as @e[type=item_display,tag=--local.name.rising_door,distance=..0.5,scores={local.block.state=0}] at @s run function bubblellaneous:blocks/rising_door/open
execute positioned ~ ~1 ~ as @e[type=item_display,tag=--local.name.rising_door,distance=..0.5,scores={local.block.state=0}] at @s run function bubblellaneous:blocks/rising_door/open
execute positioned ~1 ~ ~ as @e[type=item_display,tag=--local.name.rising_door,distance=..0.5,scores={local.block.state=0}] at @s run function bubblellaneous:blocks/rising_door/open
execute positioned ~-1 ~ ~ as @e[type=item_display,tag=--local.name.rising_door,distance=..0.5,scores={local.block.state=0}] at @s run function bubblellaneous:blocks/rising_door/open
execute positioned ~ ~ ~1 as @e[type=item_display,tag=--local.name.rising_door,distance=..0.5,scores={local.block.state=0}] at @s run function bubblellaneous:blocks/rising_door/open
execute positioned ~ ~ ~-1 as @e[type=item_display,tag=--local.name.rising_door,distance=..0.5,scores={local.block.state=0}] at @s run function bubblellaneous:blocks/rising_door/open

execute if score @s local.block.model matches 0 run data modify entity @s transformation set value {translation: [0f, 1.439f, 0f], scale: [1.01f, 1.01f, 1.01f], left_rotation: [0f, 0f, 0f, 1f], right_rotation: [0f, 0f, 0f, 1f]}
execute if score @s local.block.model matches 1 run data modify entity @s transformation set value {translation: [0f, -0.5f, 0f], scale: [1.01f, 1.01f, 1.01f], left_rotation: [0f, 0f, 0f, 1f], right_rotation: [0f, 0f, 0f, 1f]}
data merge entity @s {start_interpolation: 0, interpolation_duration: 5}
setblock ~ ~ ~ air
