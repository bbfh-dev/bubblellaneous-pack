execute positioned ^ ^ ^1 run function bubblellaneous:block/laser_block/internal/scan_here

tag @s add --local.this
scoreboard players set limit local.tmp 4
execute positioned ^ ^ ^2 run function bubblellaneous:block/laser_block/raycast
tag @s remove --local.this
