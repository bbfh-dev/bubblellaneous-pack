#! Generated using beet/bubblellaneous
function spawn:[namespace]/[name]
execute unless score NO_REPLACE local.tmp matches 1 run setblock ~ ~ ~ air
execute as @e[type=item,nbt={Age: 0s},limit=1,sort=nearest] align xyz run function [namespace]:utils/block/place
