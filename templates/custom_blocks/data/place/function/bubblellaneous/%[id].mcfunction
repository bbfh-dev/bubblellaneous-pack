#! Generated using a script
function spawn:bubblellaneous/%[id]
execute unless score NO_REPLACE bbln.tmp matches 1 run setblock ~ ~ ~ air
execute as @n[type=item,nbt={Age: 0s},distance=..1] align xyz run function bubblellaneous:utils/block/place
