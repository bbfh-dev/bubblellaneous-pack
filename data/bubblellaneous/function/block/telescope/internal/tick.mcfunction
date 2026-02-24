execute facing entity @a[tag=--bbln.player,limit=1,x=0] eyes run rotate @s ~ ~

scoreboard players set #distance bbln.tmp 0
scoreboard players set #limit bbln.tmp 255
execute rotated as @s positioned ^ ^ ^1 run function bubblellaneous:block/telescope/internal/raycast
tag @s remove --bbln.ray_hit
tag @s remove --bbln.player_found

execute rotated as @s unless entity @s[x_rotation=-42..42] run function bubblellaneous:block/telescope/internal/rotation_limit

scoreboard players operation #limit bbln.tmp = #distance bbln.tmp
scoreboard players set #distance bbln.tmp 0
execute rotated as @s positioned ^ ^ ^1 run function bubblellaneous:block/telescope/internal/raycast
#execute if entity @s[tag=!--bbln.ray_hit,tag=--bbln.telescope.blindness] run function bubblellaneous:block/telescope/internal/blindness_remove
execute if entity @s[tag=!--bbln.player_found] rotated as @s as @a[tag=--bbln.player,limit=1,x=0] run function bubblellaneous:block/telescope/internal/player_not_found
execute if entity @s[tag=--bbln.ray_hit] rotated as @s run function bubblellaneous:block/telescope/internal/hit_block
tag @s remove --bbln.ray_hit
tag @s remove --bbln.player_found

execute rotated as @s run rotate @a[tag=--bbln.player,limit=1,x=0] ~ ~
title @a[tag=--bbln.player,limit=1,x=0] actionbar [{"translate":"ui.bubblellaneous.telescope.actionbar",fallback:"⏴ %s/256 ⏵",with:[{"score":{"name": "#distance", "objective": "bbln.tmp"}, "color":"yellow"}]}]