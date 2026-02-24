#! Generated using a script
function bubblellaneous:block_placer/internal/reset_blockstate

execute at @s positioned ^ ^ ^1 if entity @e[type=item_display,tag=bbln.name.rising_door,distance=..0.5] run data modify storage bubblellaneous tmp.in.bit0 set value "i"
execute at @s positioned ^ ^ ^-1 if entity @e[type=item_display,tag=bbln.name.rising_door,distance=..0.5] run data modify storage bubblellaneous tmp.in.bit1 set value "i"
execute at @s positioned ^-1 ^ ^ if entity @e[type=item_display,tag=bbln.name.rising_door,distance=..0.5] run data modify storage bubblellaneous tmp.in.bit2 set value "i"
execute at @s positioned ^1 ^ ^ if entity @e[type=item_display,tag=bbln.name.rising_door,distance=..0.5] run data modify storage bubblellaneous tmp.in.bit3 set value "i"
execute at @s positioned ^ ^1 ^ if entity @e[type=item_display,tag=bbln.name.rising_door,distance=..0.5] run data modify storage bubblellaneous tmp.in.bit4 set value "i"
execute at @s positioned ^ ^-1 ^ if entity @e[type=item_display,tag=bbln.name.rising_door,distance=..0.5] run data modify storage bubblellaneous tmp.in.bit5 set value "i"

data modify storage bubblellaneous tmp.states set from storage bubblellaneous state_registry.rising_door
data modify storage bubblellaneous tmp.block set value "rising_door"
function bubblellaneous:block_placer/internal/set_blockstate with storage bubblellaneous tmp.in
