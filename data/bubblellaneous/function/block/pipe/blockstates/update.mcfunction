#! Generated using a script
function bubblellaneous:block_placer/internal/reset_blockstate

execute rotated as @s positioned ^ ^ ^1 if entity @e[type=item_display,tag=bbln.name.pipe,distance=..0.5,limit=1] run data modify storage bubblellaneous tmp.in.bit0 set value "i"
execute rotated as @s positioned ^ ^ ^-1 if entity @e[type=item_display,tag=bbln.name.pipe,distance=..0.5,limit=1] run data modify storage bubblellaneous tmp.in.bit1 set value "i"
execute rotated as @s positioned ^-1 ^ ^ if entity @e[type=item_display,tag=bbln.name.pipe,distance=..0.5,limit=1] run data modify storage bubblellaneous tmp.in.bit2 set value "i"
execute rotated as @s positioned ^1 ^ ^ if entity @e[type=item_display,tag=bbln.name.pipe,distance=..0.5,limit=1] run data modify storage bubblellaneous tmp.in.bit3 set value "i"
execute rotated as @s positioned ^ ^1 ^ if entity @e[type=item_display,tag=bbln.name.pipe,distance=..0.5,limit=1] run data modify storage bubblellaneous tmp.in.bit4 set value "i"
execute rotated as @s positioned ^ ^-1 ^ if entity @e[type=item_display,tag=bbln.name.pipe,distance=..0.5,limit=1] run data modify storage bubblellaneous tmp.in.bit5 set value "i"

data modify storage bubblellaneous tmp.states set from storage bubblellaneous state_registry.pipe
data modify storage bubblellaneous tmp.block set value "pipe"
function bubblellaneous:block_placer/internal/set_blockstate with storage bubblellaneous tmp.in
