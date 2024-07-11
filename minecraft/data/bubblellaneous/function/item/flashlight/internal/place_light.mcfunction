scoreboard players operation battery local.tmp *= 100 local.int
scoreboard players operation battery local.tmp /= max_battery local.tmp
scoreboard players operation battery local.tmp /= 7 local.int
scoreboard players operation battery local.tmp > 5 local.int

#region Make light dimmer as it gets further away from the player
scoreboard players set diff local.tmp 64
scoreboard players operation diff local.tmp -= backtrace_limit local.tmp
scoreboard players operation limit local.tmp -= diff local.tmp
scoreboard players set diff local.tmp 64
scoreboard players operation diff local.tmp -= limit local.tmp
scoreboard players operation diff local.tmp /= 10 local.int
scoreboard players operation battery local.tmp -= diff local.tmp
#endregion

execute store result storage bubblellaneous tmp.in.light_level int 1 run scoreboard players get battery local.tmp
function bubblellaneous:item/flashlight/internal/set_light with storage bubblellaneous tmp.in
summon marker ~ ~ ~ {Tags: ["local.light"]}
