#! Generated using a script
function bubblellaneous:block_placer/internal/reset_blockstate

execute at @s unless block ^ ^ ^1 #bubblellaneous:no_solid_collision run data modify storage bubblellaneous tmp.in.bit0 set value "i"
execute at @s unless block ^ ^ ^-1 #bubblellaneous:no_solid_collision run data modify storage bubblellaneous tmp.in.bit1 set value "i"
execute at @s unless block ^-1 ^ ^ #bubblellaneous:no_solid_collision run data modify storage bubblellaneous tmp.in.bit2 set value "i"
execute at @s unless block ^1 ^ ^ #bubblellaneous:no_solid_collision run data modify storage bubblellaneous tmp.in.bit3 set value "i"
execute at @s unless block ^ ^1 ^ #bubblellaneous:no_solid_collision run data modify storage bubblellaneous tmp.in.bit4 set value "i"
execute at @s unless block ^ ^-1 ^ #bubblellaneous:no_solid_collision run data modify storage bubblellaneous tmp.in.bit5 set value "i"

data modify storage bubblellaneous tmp.states set from storage bubblellaneous state_registry.street_light
data modify storage bubblellaneous tmp.block set value "street_light"
function bubblellaneous:block_placer/internal/set_blockstate with storage bubblellaneous tmp.in
