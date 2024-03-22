execute as @s[tag=local.name.rising_door] run function bubblellaneous:block/rising_door/internal/place_bars
execute as @s[tag=local.name.radiator] if score @s local.block_state matches 1 run function bubblellaneous:block/radiator/internal/emmit
execute as @s[tag=local.name.hatch] if score @s local.block_state matches 0 run setblock ~ ~ ~ petrified_oak_slab[type=bottom]
execute as @s[tag=local.name.retina_scanner] run function bubblellaneous:block/retina_scanner/close
execute as @s[tag=local.name.item_scanner] run function bubblellaneous:block/item_scanner/close
execute as @s[tag=local.name.keypad_lock] run function bubblellaneous:block/keypad_lock/close
execute as @s[tag=local.name.computer] run function bubblellaneous:block/computer/blockstates/apply/login {rotation: 0}
