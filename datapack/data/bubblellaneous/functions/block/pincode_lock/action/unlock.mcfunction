execute unless score @s buln.data1 = @p buln.data0 run tellraw @p {"translate":"msg.bubblellaneous.wrong_password", "color":"red"}
execute if score @s buln.data1 = @p buln.data0 run function bubblellaneous:block/pincode_lock/unlock