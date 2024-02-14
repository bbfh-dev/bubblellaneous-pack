execute if score facing local.tmp matches 0..1 run function bubblellaneous:utils/block/placer/cancel
execute if score facing local.tmp matches 2 if block ~ ~ ~1 #bubblellaneous:air run function bubblellaneous:utils/block/placer/cancel
execute if score facing local.tmp matches 2 unless block ~ ~ ~1 #bubblellaneous:air run return 180
execute if score facing local.tmp matches 3 if block ~ ~ ~-1 #bubblellaneous:air run function bubblellaneous:utils/block/placer/cancel
execute if score facing local.tmp matches 3 unless block ~ ~ ~-1 #bubblellaneous:air run return 0
execute if score facing local.tmp matches 4 if block ~1 ~ ~ #bubblellaneous:air run function bubblellaneous:utils/block/placer/cancel
execute if score facing local.tmp matches 4 unless block ~1 ~ ~ #bubblellaneous:air run return 90
execute if score facing local.tmp matches 5 if block ~-1 ~ ~ #bubblellaneous:air run function bubblellaneous:utils/block/placer/cancel
execute if score facing local.tmp matches 5 unless block ~-1 ~ ~ #bubblellaneous:air run return -90
return 0
