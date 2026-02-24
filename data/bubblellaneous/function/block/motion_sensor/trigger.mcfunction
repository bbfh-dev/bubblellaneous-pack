tag @s remove --bbln.triggered
tag @s remove --bbln.uses.tick
playsound bubblellaneous:block.motion_sensor.scan block @a[distance=..16] ~ ~ ~ 0.5 1 1
particle minecraft:flash{color:[1f, 1f, 1f, 1f]} ~ ~ ~ 1 1 1 1 10
particle minecraft:dust{color:[1f, 1f, 1f], scale:2f} ~ ~ ~ 0.8 0.8 0.8 1 10
scoreboard players set @s bbln.block.timer 200
function bubblellaneous:block_placer/internal/apply_blockstate {name: "triggered", rotation: 0}
function bubblellaneous:block/motion_sensor/internal/notify_player with entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties
