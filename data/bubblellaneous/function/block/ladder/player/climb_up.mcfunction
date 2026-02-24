execute unless predicate bubblellaneous:block/ladder_motion_down_start run function bubblellaneous:block/ladder/player/motion_reset
execute if entity @s[tag=--bbln.ladder.slow_falling] run function bubblellaneous:block/ladder/player/remove_down
tag @s add --bbln.ladder.effect
tag @s add --bbln.ladder.levitation
effect give @s minecraft:levitation 1 2 true
