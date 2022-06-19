execute if score @s buln.data0 matches -2147483648..2147483647 run function bubblellaneous:block/padlock_door/lock/unlock_check
execute unless score @s buln.data0 matches -2147483648..2147483647 run function bubblellaneous:block/padlock_door/lock/register
scoreboard players set $Boolean bubblellaneous 1