execute if score @s local.block_state matches 1 run return 0
scoreboard players set @s local.block_state 1

forceload add ~ ~

#region Save player data to return later
data modify storage bubblellaneous stack.saved_players append value {uuid: [I;], gamemode: 0}
data modify storage bubblellaneous stack.saved_players[-1].uuid set from entity @p[tag=--local.event_player] UUID
data modify storage bubblellaneous stack.saved_players[-1].gamemode set from entity @p[tag=--local.event_player] playerGameType
#endregion

execute as @p[tag=--local.event_player] at @s run function bubblellaneous:utils/dummy_player/summon

scoreboard players operation @s local.player.id = @p[tag=--local.event_player] local.player.id
playsound bubblellaneous:block.telescope.view block @p[tag=--local.event_player] ~ ~ ~ 1 1 0
tag @p[tag=--local.event_player] add --local.telescope.using
gamemode spectator @p[tag=--local.event_player]
execute rotated as @p[tag=--local.event_player] run tp @p[tag=--local.event_player] ^ ^ ^7 ~ ~
