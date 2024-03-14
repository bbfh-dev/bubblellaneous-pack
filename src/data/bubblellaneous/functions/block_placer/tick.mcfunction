data modify storage bubblellaneous tmp.in.block_properties set value {}
execute unless block ~ ~ ~ #bubblellaneous:air run function bubblellaneous:block_placer/return_block with entity @s Item.tag.bubblellaneous.block_data
execute if block ~ ~ ~ #bubblellaneous:air align xyz positioned ~.5 ~.5 ~.5 run function bubblellaneous:block_placer/place with entity @s Item.tag.bubblellaneous.block_data

kill @s
