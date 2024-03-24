execute if score @s local.block.timer matches 1.. run return 0

tag @s add --local.this
execute as @a[distance=..6] run function bubblellaneous:block/motion_sensor/internal/as_player
tag @s remove --local.this
