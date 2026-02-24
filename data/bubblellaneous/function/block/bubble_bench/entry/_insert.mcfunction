execute if score i bbln.tmp matches ..1 run data modify storage bubblellaneous tmp.final append from storage bubblellaneous tmp.origin[0]
execute if score i bbln.tmp matches ..1 run data remove storage bubblellaneous tmp.origin[0]

execute if score i bbln.tmp matches 2.. if score i bbln.tmp < j bbln.tmp run data modify storage bubblellaneous tmp.final append from storage bubblellaneous tmp.lores[0]
execute if score i bbln.tmp matches 2.. if score i bbln.tmp < j bbln.tmp run data remove storage bubblellaneous tmp.lores[0]
execute if score i bbln.tmp >= j bbln.tmp run data modify storage bubblellaneous tmp.final append from storage bubblellaneous tmp.origin[0]
execute if score i bbln.tmp >= j bbln.tmp run data remove storage bubblellaneous tmp.origin[0]

scoreboard players remove limit bbln.tmp 1
scoreboard players add i bbln.tmp 1
execute if score limit bbln.tmp matches 1.. run function bubblellaneous:block/bubble_bench/entry/_insert
