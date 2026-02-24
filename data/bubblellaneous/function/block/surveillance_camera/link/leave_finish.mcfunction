tag @s remove --bbln.camera.cancel
execute as @e[type=minecraft:item_display,tag=bbln.name.security_monitor,predicate=bubblellaneous:check/player.id,limit=1,x=0] run return run function bubblellaneous:block_placer/internal/apply_blockstate {name: "off", rotation: 0}
