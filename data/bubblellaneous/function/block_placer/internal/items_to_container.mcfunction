data modify storage minecraft:bubblellaneous tmp.temp set value []
data modify storage minecraft:bubblellaneous tmp.items set from storage bubblellaneous tmp.in.block_properties.items
function bubblellaneous:utils/items_to_container
data modify entity @e[type=item,tag=!--bbln.item,nbt={Age: 0s},distance=..0.01,limit=1] Item.components.minecraft:container set from storage bubblellaneous tmp.temp
