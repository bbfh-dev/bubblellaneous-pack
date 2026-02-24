effect clear @s[tag=--bbln.ladder.levitation] minecraft:levitation
effect clear @s[tag=--bbln.ladder.slow_falling] minecraft:slow_falling
attribute @s[tag=--bbln.ladder.sneak] minecraft:gravity modifier remove bubblellaneous:ladder
tag @s remove --bbln.ladder.effect
tag @s remove --bbln.ladder.levitation
tag @s remove --bbln.ladder.slow_falling
tag @s remove --bbln.ladder.sneak
