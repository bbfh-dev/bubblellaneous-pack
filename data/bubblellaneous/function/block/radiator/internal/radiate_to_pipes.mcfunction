# Spread heat to all nearby pipes (including self)
tag @s add --bbln.cached
scoreboard players operation @s bbln.block.timer = #pipe_counter bbln.tmp
execute if score #pipe_counter bbln.tmp matches 0 run function bubblellaneous:block/radiator/internal/pipe_melt

scoreboard players add @s bbln.block.timer 1
execute if score @s bbln.block.timer matches 3.. run scoreboard players set @s bbln.block.timer 0

# Continue spreading heat
scoreboard players operation #pipe_counter bbln.tmp = @s bbln.block.timer
execute positioned ~1 ~ ~ as @e[type=item_display,tag=bbln.name.pipe,tag=!--bbln.cached,distance=..0.5,limit=1] positioned as @s run function bubblellaneous:block/radiator/internal/radiate_to_pipes
scoreboard players operation #pipe_counter bbln.tmp = @s bbln.block.timer
execute positioned ~-1 ~ ~ as @e[type=item_display,tag=bbln.name.pipe,tag=!--bbln.cached,distance=..0.5,limit=1] positioned as @s run function bubblellaneous:block/radiator/internal/radiate_to_pipes
scoreboard players operation #pipe_counter bbln.tmp = @s bbln.block.timer
execute positioned ~ ~1 ~ as @e[type=item_display,tag=bbln.name.pipe,tag=!--bbln.cached,distance=..0.5,limit=1] positioned as @s run function bubblellaneous:block/radiator/internal/radiate_to_pipes
scoreboard players operation #pipe_counter bbln.tmp = @s bbln.block.timer
execute positioned ~ ~-1 ~ as @e[type=item_display,tag=bbln.name.pipe,tag=!--bbln.cached,distance=..0.5,limit=1] positioned as @s run function bubblellaneous:block/radiator/internal/radiate_to_pipes
scoreboard players operation #pipe_counter bbln.tmp = @s bbln.block.timer
execute positioned ~ ~ ~1 as @e[type=item_display,tag=bbln.name.pipe,tag=!--bbln.cached,distance=..0.5,limit=1] positioned as @s run function bubblellaneous:block/radiator/internal/radiate_to_pipes
scoreboard players operation #pipe_counter bbln.tmp = @s bbln.block.timer
execute positioned ~ ~ ~-1 as @e[type=item_display,tag=bbln.name.pipe,tag=!--bbln.cached,distance=..0.5,limit=1] positioned as @s run function bubblellaneous:block/radiator/internal/radiate_to_pipes

