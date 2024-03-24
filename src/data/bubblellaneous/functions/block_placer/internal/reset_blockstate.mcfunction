data modify storage bubblellaneous tmp.in.bit0 set value "o"
data modify storage bubblellaneous tmp.in.bit1 set value "o"
data modify storage bubblellaneous tmp.in.bit2 set value "o"
data modify storage bubblellaneous tmp.in.bit3 set value "o"
data modify storage bubblellaneous tmp.in.bit4 set value "o"
data modify storage bubblellaneous tmp.in.bit5 set value "o"
execute store result entity @s Rotation[0] float 1 run data get entity @s item.tag.bubblellaneous.block_properties.rotation
