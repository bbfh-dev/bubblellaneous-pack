kill @e[type=item,nbt={Age: 0s},distance=..2,limit=1,sort=nearest]
data modify storage bubblellaneous tmp.in.block_properties set from entity @s item.tag.bubblellaneous.block_properties
function bubblellaneous:placer/return_block with entity @s item.tag.bubblellaneous.block_data

kill @s
