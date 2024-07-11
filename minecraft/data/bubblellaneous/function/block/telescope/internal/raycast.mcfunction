execute unless block ~ ~ ~ #bubblellaneous:telescope_see_through run return run function bubblellaneous:block/telescope/internal/hit_block
execute positioned ~ ~-1 ~ if entity @p[tag=--local.player,distance=..2] run return run function bubblellaneous:block/telescope/internal/hit_player

scoreboard players remove limit local.tmp 1
execute if score limit local.tmp matches 1.. positioned ^ ^ ^1 run function bubblellaneous:block/telescope/internal/raycast
