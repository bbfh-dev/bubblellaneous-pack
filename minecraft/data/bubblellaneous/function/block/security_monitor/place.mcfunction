summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "local.security_monitor", "local.base", "--local.new"], width: 0.875f, height: 0.625f, response: 1b}
execute align xyz positioned ~.5 ~ ~.5 run tp @e[type=interaction,tag=--local.new,limit=1,sort=nearest] ^ ^0.1875 ^-0.75 ~ ~
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1,sort=nearest] remove --local.new

execute unless data entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.camera run function bubblellaneous:block/security_monitor/blockstates/apply/off {rotation: 0}
execute if score camera.disabled local.settings matches 1 run function bubblellaneous:block/security_monitor/blockstates/apply/disabled {rotation: 0}

execute summon text_display run data merge entity @s {Tags: ["+bubblellaneous", "local.text", "--local.new"], width: 1f, height: 1f, text: "", shadow: 1b, background: 0, transformation: {scale: [0.33f, 0.33f, 0.33f]}, Rotation: [0f, 0f]}
data modify entity @e[type=text_display,tag=--local.new,limit=1,sort=nearest] text set from entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.camera.name
execute align xyz positioned ~.5 ~ ~.5 run tp @e[type=text_display,tag=--local.new,limit=1,sort=nearest] ^ ^0.75 ^-0.31 ~ ~
scoreboard players operation @e[type=text_display,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=text_display,tag=--local.new,limit=1,sort=nearest] remove --local.new
