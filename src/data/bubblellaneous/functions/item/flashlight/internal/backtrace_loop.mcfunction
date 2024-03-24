execute if block ~ ~ ~ #bubblellaneous:air run return run function bubblellaneous:item/flashlight/internal/place_light

scoreboard players remove backtrace_limit local.tmp 1
execute if score backtrace_limit local.tmp matches 1.. positioned ^ ^ ^-0.5 run function bubblellaneous:item/flashlight/internal/backtrace_loop
