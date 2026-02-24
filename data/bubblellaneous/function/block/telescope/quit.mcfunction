scoreboard players set @s bbln.block_state 0
execute as @a[tag=--bbln.player,limit=1,x=0] run function bubblellaneous:block/telescope/quit_player
forceload remove ~ ~
