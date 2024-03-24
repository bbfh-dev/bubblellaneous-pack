execute unless score @s local.block_state matches 4.. run return 0

scoreboard players operation id local.tmp = @s local.block.id
execute as @e[type=text_display,tag=local.keypad.screen,distance=..2] if score @s local.block.id = id local.tmp run data modify storage bubblellaneous tmp.code set from entity @s text
function bubblellaneous:block/keypad_lock/reset

execute unless score @s local.gui.page matches 1 run return run function bubblellaneous:block/keypad_lock/set_credentials

execute store success score success local.tmp run data modify storage bubblellaneous tmp.code set from entity @s item.tag.bubblellaneous.block_properties.lock
execute if score success local.tmp matches 0 run function bubblellaneous:block/keypad_lock/open
execute if score success local.tmp matches 1 run function bubblellaneous:block/keypad_lock/error
