execute if score facing local.tmp matches 0 run data modify storage bubblellaneous tmp.in.rotation_y set value 90
execute if score facing local.tmp matches 1 run data modify storage bubblellaneous tmp.in.rotation_y set value -90
execute if score facing local.tmp matches 2 run return 180
execute if score facing local.tmp matches 3 run return 0
execute if score facing local.tmp matches 4 run return 90
execute if score facing local.tmp matches 5 run return -90
return 0
