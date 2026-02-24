execute store result score #temp bbln.tmp run function bubblellaneous:blocks/light/get
scoreboard players operation #light bbln.tmp += #temp bbln.tmp
scoreboard players add #light_count bbln.tmp 1
