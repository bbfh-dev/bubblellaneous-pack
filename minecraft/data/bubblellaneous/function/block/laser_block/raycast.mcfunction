execute unless block ~ ~ ~ #bubblellaneous:no_solid_collision run return 0

function bubblellaneous:block/laser_block/internal/scan_here

scoreboard players remove limit local.tmp 1
execute if score limit local.tmp matches 1.. positioned ^ ^ ^1 run function bubblellaneous:block/laser_block/raycast
