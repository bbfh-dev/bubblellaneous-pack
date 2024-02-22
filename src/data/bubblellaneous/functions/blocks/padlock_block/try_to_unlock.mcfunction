execute store result score has_key local.tmp run function bubblellaneous:blocks/padlock_block/internal/get_key with entity @s item.tag.block_data
execute if score has_key local.tmp matches 0 run function bubblellaneous:blocks/padlock_block/internal/print_error with entity @s item.tag.block_data
execute if score has_key local.tmp matches 1 run function bubblellaneous:blocks/padlock_block/unlock
