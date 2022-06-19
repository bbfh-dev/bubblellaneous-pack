#  When opened
execute unless entity @s[tag=-buln.opened] run function bubblellaneous:block/bubble_bench/opened
tag @s add -buln.opened


#  Interaction
execute as @a[distance=..6] store result score @s bubblellaneous run clear @s item_frame{Bubblellaneous:{pack:1b}} 0
execute at @a[scores={bubblellaneous=1..}] run function bubblellaneous:block/bubble_bench/interaction/instance