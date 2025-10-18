playsound bubblellaneous:block.motion_sensor.scan block @a ~ ~ ~ 1 1 1
particle minecraft:flash{color:[1, 1, 1, 1]} ~ ~ ~ 1 1 1 1 10
particle dust{color:[1, 1, 1], scale:2} ~ ~ ~ 0.8 0.8 0.8 1 10
scoreboard players set @s local.block.timer 200
function bubblellaneous:block/motion_sensor/blockstates/apply/triggered {rotation: 0}
function bubblellaneous:block/motion_sensor/internal/notify_player with entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties
