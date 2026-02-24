execute if entity @s[tag=!--bbln.ladder.slow_falling] unless predicate bubblellaneous:block/ladder_motion_down_start run function bubblellaneous:block/ladder/player/motion_reset
execute if entity @s[tag=--bbln.ladder.levitation] run function bubblellaneous:block/ladder/player/remove_up
tag @s add --bbln.ladder.effect
tag @s add --bbln.ladder.slow_falling
effect give @s minecraft:slow_falling 1 0 true
