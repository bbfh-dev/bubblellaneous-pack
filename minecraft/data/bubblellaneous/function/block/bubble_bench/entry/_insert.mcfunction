execute if score i local.tmp matches ..1 run data modify storage bubblellaneous tmp.final append from storage bubblellaneous tmp.origin[0]
execute if score i local.tmp matches ..1 run data remove storage bubblellaneous tmp.origin[0]

execute if score i local.tmp matches 2.. if score i local.tmp < j local.tmp run data modify storage bubblellaneous tmp.final append from storage bubblellaneous tmp.lores[0]
execute if score i local.tmp matches 2.. if score i local.tmp < j local.tmp run data remove storage bubblellaneous tmp.lores[0]
execute if score i local.tmp >= j local.tmp run data modify storage bubblellaneous tmp.final append from storage bubblellaneous tmp.origin[0]
execute if score i local.tmp >= j local.tmp run data remove storage bubblellaneous tmp.origin[0]

scoreboard players remove limit local.tmp 1
scoreboard players add i local.tmp 1
execute if score limit local.tmp matches 1.. run function bubblellaneous:block/bubble_bench/entry/_insert
