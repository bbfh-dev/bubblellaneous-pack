execute if score @s local.block_state matches 1 run function bubblellaneous:block/padlock_block/when_locked with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data.material
execute if score @s local.block_state matches 0 run function bubblellaneous:block/padlock_block/when_not_set
