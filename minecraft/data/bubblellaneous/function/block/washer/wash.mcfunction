execute store success score washed local.tmp run data remove block ~ ~ ~ Items[0].components."minecraft:dyed_color"
execute if score washed local.tmp matches 1 run function bubblellaneous:block/washer/internal/use_water
execute if score washed local.tmp matches 1 run return 0

execute store success score washed local.tmp run data remove block ~ ~ ~ Items[1].components."minecraft:dyed_color"
execute if score washed local.tmp matches 1 run function bubblellaneous:block/washer/internal/use_water
execute if score washed local.tmp matches 1 run return 0

execute store success score washed local.tmp run data remove block ~ ~ ~ Items[2].components."minecraft:dyed_color"
execute if score washed local.tmp matches 1 run function bubblellaneous:block/washer/internal/use_water
execute if score washed local.tmp matches 1 run return 0

execute store success score washed local.tmp run data remove block ~ ~ ~ Items[3].components."minecraft:dyed_color"
execute if score washed local.tmp matches 1 run function bubblellaneous:block/washer/internal/use_water
execute if score washed local.tmp matches 1 run return 0

execute store success score washed local.tmp run data remove block ~ ~ ~ Items[4].components."minecraft:dyed_color"
execute if score washed local.tmp matches 1 run function bubblellaneous:block/washer/internal/use_water
execute if score washed local.tmp matches 1 run return 0
