setblock ~ ~ ~ air

kill @e[type=item,nbt={Age: 0s},distance=..2,limit=1,sort=nearest]
data modify storage bubblellaneous tmp.in.block_properties set from entity @s item.tag.bubblellaneous.block_properties
function bubblellaneous:placer/return_block with entity @s item.tag.bubblellaneous.block_data

scoreboard players operation this local.tmp = @s local.block.id
execute as @e[type=#bubblellaneous:entity,distance=..3] if score @s local.block.id = this local.tmp run kill @s
