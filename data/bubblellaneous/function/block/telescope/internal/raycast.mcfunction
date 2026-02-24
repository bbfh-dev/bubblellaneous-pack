execute unless block ~ ~ ~ #bubblellaneous:telescope_see_through run return run tag @s add --bbln.ray_hit
execute positioned ^ ^ ^-1 positioned ~-0.5 ~-0.5 ~-0.5 if entity @a[tag=--bbln.player,limit=1,dx=0] positioned ~ ~-1.62 ~ if entity @a[tag=--bbln.player,limit=1,dx=0] run return run tag @s add --bbln.player_found
execute if function bubblellaneous:block/telescope/internal/hit_entity run return run tag @s add --bbln.ray_hit

scoreboard players add #distance bbln.tmp 1
execute if score #distance bbln.tmp <= #limit bbln.tmp positioned ^ ^ ^1 run function bubblellaneous:block/telescope/internal/raycast
