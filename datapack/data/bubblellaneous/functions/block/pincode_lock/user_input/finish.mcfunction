execute if score @p buln.data0 matches 0 run tellraw @p {"translate":"msg.bubblellaneous.enter_first", "color":"red"}
execute if score @p buln.data0 matches 1.. run function bubblellaneous:block/pincode_lock/user_input/finish_pass
tag @p remove -buln.input.pincode_lock
function bubblellaneous:misc/gamerule_reset