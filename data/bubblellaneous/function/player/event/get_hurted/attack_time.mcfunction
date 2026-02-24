execute store result score #temp bbln.tmp run data get entity @s attack.timestamp
data remove entity @s attack
return run execute if score #temp bbln.tmp = #gametime bbln.tmp
