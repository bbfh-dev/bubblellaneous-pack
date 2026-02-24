execute store result score #temp bbln.tmp run data get entity @s interaction.timestamp
data remove entity @s interaction
return run execute if score #temp bbln.tmp = #gametime bbln.tmp
