setblock ~ ~ ~ air

scoreboard players set uses_blockstates local.tmp 0
execute as @s[tag=--local.uses.blockstates] run scoreboard players set uses_blockstates local.tmp 1
kill @e[type=item,nbt={Age: 0s},distance=..2]
data modify storage bubblellaneous tmp.in.block_properties set from entity @s item.tag.bubblellaneous.block_properties
function bubblellaneous:block_placer/return_block with entity @s item.tag.bubblellaneous.block_data

function bubblellaneous:blocks/kill
execute if score uses_blockstates local.tmp matches 1 run function bubblellaneous:block_placer/internal/update_blockstates with entity @s item.tag.bubblellaneous.block_data
