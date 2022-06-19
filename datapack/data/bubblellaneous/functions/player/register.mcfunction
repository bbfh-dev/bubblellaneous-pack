advancement revoke @s only bubblellaneous:event/not_registered
execute store result score @s buln.digit0 run data get entity @s UUID[0]
execute store result score @s buln.digit1 run data get entity @s UUID[1]
execute store result score @s buln.digit2 run data get entity @s UUID[2]
execute store result score @s buln.digit3 run data get entity @s UUID[3]
scoreboard players add $Score buln.data2 1
scoreboard players operation @s buln.data2 = $Score buln.data2