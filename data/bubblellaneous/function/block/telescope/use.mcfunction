execute if score @s bbln.block_state matches 1 run return 0
scoreboard players set @s bbln.block_state 1

forceload add ~ ~

execute as @a[tag=--bbln.event_player,limit=1,x=0] run function bubblellaneous:block/telescope/event_player
