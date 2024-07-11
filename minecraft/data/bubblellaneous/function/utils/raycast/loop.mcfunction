$execute if block ~ ~ ~ $(block) run return run function bubblellaneous:utils/raycast/hit

scoreboard players remove limit local.tmp 1
execute if score limit local.tmp matches 1.. positioned ^ ^ ^.25 run function bubblellaneous:utils/raycast/loop with storage bubblellaneous tmp.raycast
