setblock ~ ~ ~ air
setblock ~ ~ ~ barrel[facing=up]{CustomName:'""'}

execute unless score @s buln.digit0 matches -2147483648..2147483647 run function bubblellaneous:block/item_reader/init/register
execute if score @s buln.digit0 matches -2147483648..2147483647 run function bubblellaneous:block/item_reader/init/unlock