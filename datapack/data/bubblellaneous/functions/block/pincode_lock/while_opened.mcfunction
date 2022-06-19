setblock ~ ~ ~ air
setblock ~ ~ ~ barrel[facing=up]{CustomName:'""'}

execute unless score @s buln.digit1 matches -2147483648..2147483647 run function bubblellaneous:block/pincode_lock/init/register
execute if score @s buln.digit1 matches -2147483648..2147483647 run function bubblellaneous:block/pincode_lock/init/unlock