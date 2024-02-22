scoreboard players remove @s[scores={local.block.state=1..}] local.block.state 1
execute if score @s local.block.state matches 0 run function bubblellaneous:blocks/washer/blockstate/set_empty {rotate: 0}
