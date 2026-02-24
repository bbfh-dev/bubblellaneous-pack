execute unless score @s bbln.block_state matches 4.. run return 0

execute as @e[type=text_display,tag=bbln.keypad.screen,predicate=bubblellaneous:check/block.id,limit=1,x=0] run data modify storage bubblellaneous tmp.code set from entity @s text
function bubblellaneous:block/keypad_lock/reset

execute unless score @s bbln.gui.page matches 1 run return run function bubblellaneous:block/keypad_lock/set_credentials

execute unless function bubblellaneous:block/keypad_lock/click/code_comparision run return run function bubblellaneous:block/keypad_lock/open
function bubblellaneous:block/keypad_lock/error
