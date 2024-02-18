function bubblellaneous:blocks/bubble_bench/item/craft_block

scoreboard players remove limit local.tmp 1
execute if score limit local.tmp matches 1.. run function bubblellaneous:blocks/bubble_bench/item/internal/craft_blocks
