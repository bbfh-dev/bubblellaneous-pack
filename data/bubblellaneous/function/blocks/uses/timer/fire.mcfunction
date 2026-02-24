scoreboard players set @s bbln.block.timer -1
execute if entity @s[tag=bbln.name.rising_door] run function bubblellaneous:block/rising_door/internal/place_bars
execute if entity @s[tag=bbln.name.radiator] if score @s bbln.block_state matches 1 run function bubblellaneous:block/radiator/internal/emmit
execute if entity @s[tag=bbln.name.hatch] run function bubblellaneous:block/hatch/timer
execute if entity @s[tag=bbln.name.retina_scanner] run function bubblellaneous:block/retina_scanner/close
execute if entity @s[tag=bbln.name.item_scanner] run function bubblellaneous:block/item_scanner/close
execute if entity @s[tag=bbln.name.keypad_lock] run function bubblellaneous:block/keypad_lock/close
execute if entity @s[tag=bbln.name.computer] run function bubblellaneous:block_placer/internal/apply_blockstate {name: "login", rotation: 0}
execute if entity @s[tag=bbln.name.laser_block] run function bubblellaneous:block/laser_block/deactivate
execute if entity @s[tag=bbln.name.motion_sensor] run function bubblellaneous:block/motion_sensor/timeout
execute if entity @s[tag=bbln.name.bear_trap] if score @s bbln.block_state matches 1 run function bubblellaneous:block/bear_trap/timeout
execute if entity @s[tag=bbln.name.safe_block] if block ~ ~ ~ minecraft:barrel[open=false] run function bubblellaneous:block/safe_block/close
