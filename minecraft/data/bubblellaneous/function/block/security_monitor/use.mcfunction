function bubblellaneous:utils/silent_feedback

execute if score @s local.block.model matches 1 run return run function bubblellaneous:block/security_monitor/internal/error_offline
execute if score @s local.block.model matches 2 run return run function bubblellaneous:block/security_monitor/internal/error_disabled

execute as @p[tag=--local.event_player] at @s run function bubblellaneous:utils/dummy_player/summon

#region Save player data to return later
data modify storage bubblellaneous stack.saved_players append value {uuid: [I;], x: 0d, y: 0d, z: 0d, rx: 0f, ry: 0f, dimension: "", gamemode: 0}
data modify storage bubblellaneous stack.saved_players[-1].uuid set from entity @p[tag=--local.event_player] UUID
data modify storage bubblellaneous stack.saved_players[-1].x set from entity @p[tag=--local.event_player] Pos[0]
data modify storage bubblellaneous stack.saved_players[-1].y set from entity @p[tag=--local.event_player] Pos[1]
data modify storage bubblellaneous stack.saved_players[-1].z set from entity @p[tag=--local.event_player] Pos[2]
data modify storage bubblellaneous stack.saved_players[-1].rx set from entity @p[tag=--local.event_player] Rotation[0]
data modify storage bubblellaneous stack.saved_players[-1].ry set from entity @p[tag=--local.event_player] Rotation[1]
data modify storage bubblellaneous stack.saved_players[-1].dimension set from entity @p[tag=--local.event_player] Dimension
data modify storage bubblellaneous stack.saved_players[-1].gamemode set from entity @p[tag=--local.event_player] playerGameType
#endregion

gamemode spectator @p[tag=--local.event_player]
data modify storage bubblellaneous tmp.in set from entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.camera.location
execute as @p[tag=--local.event_player] run function bubblellaneous:utils/multidimension_teleport with storage bubblellaneous tmp.in

tag @p[tag=--local.event_player] add --local.camera.spectating
execute store result score @p[tag=--local.event_player] local.block.id run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.camera.id
