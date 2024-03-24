schedule clear bubblellaneous:block/bubble_bench/settings/allow_crafting/tick

execute if score bench.allow_crafting local.settings matches 1 run function bubblellaneous:block/bubble_bench/settings/allow_crafting/tick

execute if score camera.disabled local.settings matches 0 as @e[type=item_display,tag=local.name.security_monitor] run function bubblellaneous:block/security_monitor/blockstates/apply/default {rotation: 0}
execute if score camera.disabled local.settings matches 1 as @e[type=item_display,tag=local.name.security_monitor] run function bubblellaneous:block/security_monitor/blockstates/apply/disabled {rotation: 0}
