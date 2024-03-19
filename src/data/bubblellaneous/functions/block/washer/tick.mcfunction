execute if block ~ ~0.5 ~ water[level=0] run function bubblellaneous:block/washer/refill
execute if score @s local.block_state matches 1.. if data block ~ ~ ~ Items[] run function bubblellaneous:block/washer/wash
