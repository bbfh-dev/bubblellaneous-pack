scoreboard players operation battery local.tmp *= 100 local.int
scoreboard players operation battery local.tmp /= max_battery local.tmp
scoreboard players operation battery local.tmp /= 7 local.int
execute if score battery local.tmp matches ..10 run scoreboard players add battery local.tmp 5
execute store result storage bubblellaneous tmp.in.light_level int 1 run scoreboard players get battery local.tmp
function bubblellaneous:item/flashlight/internal/set_light with storage bubblellaneous tmp.in
summon marker ~ ~ ~ {Tags: ["local.light"]}
