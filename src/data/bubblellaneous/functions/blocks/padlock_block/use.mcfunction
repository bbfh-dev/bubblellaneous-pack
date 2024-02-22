# data modify storage bubblellaneous tmp.input.color set string entity @s item.tag.block_data.name 0 -14

execute if score @s local.block.state matches 1 run function bubblellaneous:blocks/padlock_block/try_to_unlock
execute if score @s local.block.state matches 0 run function bubblellaneous:blocks/padlock_block/set_key
