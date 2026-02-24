tag @s remove --bbln.camera.cancel
scoreboard players operation #id_test bbln.tmp = @s bbln.player.id
execute as @e[type=minecraft:item_display,tag=bbln.name.security_monitor,predicate=bubblellaneous:check/player.id,limit=1,x=0] run return run function bubblellaneous:block_placer/internal/apply_blockstate {name: "off", rotation: 0}
tag @s add --bbln.camera.cancel


