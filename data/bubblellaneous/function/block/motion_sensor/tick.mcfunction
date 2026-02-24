tag @s add --bbln.this
execute as @a[gamemode=!spectator,distance=..6,predicate=!bubblellaneous:check/zero_motion] align xyz positioned ~-6 ~ ~-6 if entity @s[dx=11,dz=11] run function bubblellaneous:block/motion_sensor/internal/as_player
execute if entity @s[tag=--bbln.triggered] run function bubblellaneous:block/motion_sensor/trigger
tag @s remove --bbln.this
