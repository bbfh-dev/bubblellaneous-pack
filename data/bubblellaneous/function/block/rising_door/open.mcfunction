scoreboard players set @s bbln.block_state 1

execute if score #sound bbln.tmp matches 1 run playsound bubblellaneous:block.safe_block.open block @a[distance=..16] ~ ~ ~ 0.5 1 0

scoreboard players set #sound bbln.tmp 0
execute positioned ~ ~-1 ~ as @e[type=item_display,tag=bbln.name.rising_door,distance=..0.5,scores={bbln.block_state=0}] at @s run function bubblellaneous:block/rising_door/open
execute positioned ~ ~1 ~ as @e[type=item_display,tag=bbln.name.rising_door,distance=..0.5,scores={bbln.block_state=0}] at @s run function bubblellaneous:block/rising_door/open
execute positioned ~1 ~ ~ as @e[type=item_display,tag=bbln.name.rising_door,distance=..0.5,scores={bbln.block_state=0}] at @s run function bubblellaneous:block/rising_door/open
execute positioned ~-1 ~ ~ as @e[type=item_display,tag=bbln.name.rising_door,distance=..0.5,scores={bbln.block_state=0}] at @s run function bubblellaneous:block/rising_door/open
execute positioned ~ ~ ~1 as @e[type=item_display,tag=bbln.name.rising_door,distance=..0.5,scores={bbln.block_state=0}] at @s run function bubblellaneous:block/rising_door/open
execute positioned ~ ~ ~-1 as @e[type=item_display,tag=bbln.name.rising_door,distance=..0.5,scores={bbln.block_state=0}] at @s run function bubblellaneous:block/rising_door/open

execute if data entity @s item.components.minecraft:custom_data.bubblellaneous.block_properties{block_state: "default"} run \
	data modify entity @s transformation set value {translation: [0f, 0.94f, 0f], scale: [1.01f, 1.01f, 1.01f], left_rotation: [0f, 0f, 0f, 1f], right_rotation: [0f, 0f, 0f, 1f]}

execute if data entity @s item.components.minecraft:custom_data.bubblellaneous.block_properties{block_state: "bottom"} run \
	data modify entity @s transformation set value {translation: [0f, -1f, 0f], scale: [1.01f, 1.01f, 1.01f], left_rotation: [0f, 0f, 0f, 1f], right_rotation: [0f, 0f, 0f, 1f]}

setblock ~ ~ ~ air
