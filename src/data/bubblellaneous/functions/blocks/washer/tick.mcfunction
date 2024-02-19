execute if block ~ ~1 ~ water[level=15] run function bubblellaneous:blocks/washer/refill
execute if score @s local.block.state matches 1.. if data block ~ ~ ~ Items[] run function bubblellaneous:blocks/washer/wash
