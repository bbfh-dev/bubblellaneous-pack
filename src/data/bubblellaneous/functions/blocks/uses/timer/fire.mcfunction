execute as @s[tag=local.name.rising_door] run function bubblellaneous:block/rising_door/internal/place_bars
execute as @s[tag=local.name.radiator] if score @s local.block_state matches 1 run function bubblellaneous:block/radiator/internal/emmit
