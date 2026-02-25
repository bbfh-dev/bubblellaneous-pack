function bubblellaneous:utils/silent_feedback

execute if data entity @s item.components.minecraft:custom_data.bubblellaneous.block_properties{block_state: "off"} run \
	return run function bubblellaneous:block/security_monitor/internal/error_offline
execute if data entity @s item.components.minecraft:custom_data.bubblellaneous.block_properties{block_state: "disabled"} run \
	return run function bubblellaneous:block/security_monitor/internal/error_disabled

execute as @a[tag=--bbln.event_player,limit=1,x=0] at @s run function bubblellaneous:block/security_monitor/player
execute store result score @a[tag=--bbln.event_player,limit=1,x=0] bbln.block.id run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.camera.id
scoreboard players operation @s bbln.player.id = @a[tag=--bbln.event_player,limit=1,x=0] bbln.player.id

data modify storage bubblellaneous tmp.in set from entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.camera.location
execute as @a[tag=--bbln.event_player,limit=1,x=0] run function bubblellaneous:block/surveillance_camera/player/multidimension_teleport with storage bubblellaneous tmp.in
