execute unless predicate bubblellaneous:check/zero_motion_dummy_player at @s run return run function bubblellaneous:utils/dummy_player/on_hit
execute if data entity @s {HurtTime:10s} at @s run return run function bubblellaneous:utils/dummy_player/on_hit
