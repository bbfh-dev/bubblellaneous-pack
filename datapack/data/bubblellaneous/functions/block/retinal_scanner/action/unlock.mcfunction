scoreboard players set $Boolean bubblellaneous 0
execute if score @s buln.digit0 = @p buln.digit0 if score @s buln.digit1 = @p buln.digit1 if score @s buln.digit2 = @p buln.digit2 if score @s buln.digit3 = @p buln.digit3 run scoreboard players set $Boolean bubblellaneous 1

execute if score $Boolean bubblellaneous matches 0 run tellraw @p {"translate":"msg.bubblellaneous.wrong_password", "color":"red"}
execute if score $Boolean bubblellaneous matches 1 run function bubblellaneous:block/retinal_scanner/unlock