advancement revoke @s only bubblellaneous:event/player/use_seat

tag @s add --local.player
execute anchored eyes positioned ^ ^ ^2 as @e[type=interaction,tag=local.seat,limit=1,sort=nearest] run ride @p[tag=--local.player] mount @s
tag @s remove --local.player
