schedule clear bubblellaneous:blocks/bubble_bench/schedule/obtaining/tick
schedule clear bubblellaneous:blocks/security_camera/lens/while_not_fixed

execute if score bubble_bench.allow_obtaining local.settings matches 1 run function bubblellaneous:blocks/bubble_bench/schedule/obtaining/tick
execute if data storage bubblellaneous bench_blacklist run schedule function bubblellaneous:blocks/bubble_bench/schedule/blacklist/load 2t replace

execute if score cameras.disable local.settings matches 1 as @e[type=item_display,tag=--local.name.security_monitor] at @s run function bubblellaneous:blocks/security_monitor/disable
execute if score cameras.is_fixed local.settings matches 0 run function bubblellaneous:blocks/security_camera/lens/while_not_fixed
