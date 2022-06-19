scoreboard players operation @s buln.digit0 = @p buln.digit0
scoreboard players operation @s buln.digit1 = @p buln.digit1
scoreboard players operation @s buln.digit2 = @p buln.digit2
scoreboard players operation @s buln.digit3 = @p buln.digit3
tellraw @p {"translate":"msg.bubblellaneous.registered", "color":"green", "with":[{"translate":"block.bubblellaneous.retinal_scanner"}]}
function bubblellaneous:block/retinal_scanner/lock
playsound bubblellaneous:block.lock.register block @a ~ ~ ~ 1