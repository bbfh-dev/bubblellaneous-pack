scoreboard players remove @s[scores={local.block_state=1..}] local.block_state 1
execute if score @s local.block_state matches 0 run function bubblellaneous:block/washer/blockstates/apply/default {rotation: 0}
