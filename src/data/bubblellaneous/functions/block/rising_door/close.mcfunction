scoreboard players set @s local.block_state 0

execute unless score is_playing local.tmp matches 1 run playsound bubblellaneous:block.safe_block.close block @a ~ ~ ~ 1 1 0

scoreboard players set is_playing local.tmp 1
execute positioned ~ ~-1 ~ as @e[type=item_display,tag=local.name.rising_door,distance=..0.5,scores={local.block_state=1}] at @s run function bubblellaneous:block/rising_door/close
execute positioned ~ ~1 ~ as @e[type=item_display,tag=local.name.rising_door,distance=..0.5,scores={local.block_state=1}] at @s run function bubblellaneous:block/rising_door/close
execute positioned ~-1 ~ ~ as @e[type=item_display,tag=local.name.rising_door,distance=..0.5,scores={local.block_state=1}] at @s run function bubblellaneous:block/rising_door/close
execute positioned ~1 ~ ~ as @e[type=item_display,tag=local.name.rising_door,distance=..0.5,scores={local.block_state=1}] at @s run function bubblellaneous:block/rising_door/close
execute positioned ~ ~ ~-1 as @e[type=item_display,tag=local.name.rising_door,distance=..0.5,scores={local.block_state=1}] at @s run function bubblellaneous:block/rising_door/close
execute positioned ~ ~ ~1 as @e[type=item_display,tag=local.name.rising_door,distance=..0.5,scores={local.block_state=1}] at @s run function bubblellaneous:block/rising_door/close

data modify entity @s transformation set value {translation: [0f, 0f, 0f], scale: [1.01f, 1.01f, 1.01f], left_rotation: [0f, 0f, 0f, 1f], right_rotation: [0f, 0f, 0f, 1f]}
data merge entity @s {start_interpolation: 0, interpolation_duration: 5}

execute store result score rotation local.tmp run data get entity @s Rotation[0]
scoreboard players set @s local.block.timer 5
