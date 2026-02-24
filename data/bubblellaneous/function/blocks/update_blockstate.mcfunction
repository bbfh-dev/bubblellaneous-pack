function bubblellaneous:block_placer/internal/reset_blockstate

$execute at @s positioned ^ ^ ^1 if entity @e[type=item_display,tag=bbln.name.$(name),distance=..0.5] run data modify storage bubblellaneous tmp.in.bit0 set value "i"
$execute at @s positioned ^ ^ ^-1 if entity @e[type=item_display,tag=bbln.name.$(name),distance=..0.5] run data modify storage bubblellaneous tmp.in.bit1 set value "i"
$execute at @s positioned ^-1 ^ ^ if entity @e[type=item_display,tag=bbln.name.$(name),distance=..0.5] run data modify storage bubblellaneous tmp.in.bit2 set value "i"
$execute at @s positioned ^1 ^ ^ if entity @e[type=item_display,tag=bbln.name.$(name),distance=..0.5] run data modify storage bubblellaneous tmp.in.bit3 set value "i"
$execute at @s positioned ^ ^1 ^ if entity @e[type=item_display,tag=bbln.name.$(name),distance=..0.5] run data modify storage bubblellaneous tmp.in.bit4 set value "i"
$execute at @s positioned ^ ^-1 ^ if entity @e[type=item_display,tag=bbln.name.$(name),distance=..0.5] run data modify storage bubblellaneous tmp.in.bit5 set value "i"

execute if entity @s[tag=--bbln.uses.block_based_state] run function ./_based_on_block
	execute at @s unless block ^ ^ ^1 #bubblellaneous:no_solid_collision run data modify storage bubblellaneous tmp.in.bit0 set value "i"
	execute at @s unless block ^ ^ ^-1 #bubblellaneous:no_solid_collision run data modify storage bubblellaneous tmp.in.bit1 set value "i"
	execute at @s unless block ^-1 ^ ^ #bubblellaneous:no_solid_collision run data modify storage bubblellaneous tmp.in.bit2 set value "i"
	execute at @s unless block ^1 ^ ^ #bubblellaneous:no_solid_collision run data modify storage bubblellaneous tmp.in.bit3 set value "i"
	execute at @s unless block ^ ^1 ^ #bubblellaneous:no_solid_collision run data modify storage bubblellaneous tmp.in.bit4 set value "i"
	execute at @s unless block ^ ^-1 ^ #bubblellaneous:no_solid_collision run data modify storage bubblellaneous tmp.in.bit5 set value "i"

$data modify storage bubblellaneous tmp.states set from storage bubblellaneous state_registry.$(name)
$data modify storage bubblellaneous tmp.block set value "$(name)"
function bubblellaneous:block_placer/internal/set_blockstate with storage bubblellaneous tmp.in
