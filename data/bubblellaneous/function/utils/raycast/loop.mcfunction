$execute if block ~ ~ ~ $(block) run return run function bubblellaneous:utils/raycast/hit

scoreboard players remove #limit bbln.tmp 1
execute if score #limit bbln.tmp matches 1.. positioned ^ ^ ^0.25 run function bubblellaneous:utils/raycast/loop with storage bubblellaneous tmp.raycast
