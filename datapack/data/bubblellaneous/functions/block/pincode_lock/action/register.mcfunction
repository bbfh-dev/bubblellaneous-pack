scoreboard players operation @s buln.data1 = @p buln.data0
tellraw @p {"translate":"msg.bubblellaneous.registered", "color":"green", "with":[{"translate":"block.bubblellaneous.pincode_lock"}]}
function bubblellaneous:block/pincode_lock/lock
playsound bubblellaneous:block.lock.register block @a ~ ~ ~ 1