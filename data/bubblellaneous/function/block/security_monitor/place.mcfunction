summon interaction ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.security_monitor", "bbln.base", "--bbln.new"], width: 0.875f, height: 0.625f, response: 1b}
execute align xyz positioned ~0.5 ~ ~0.5 run tp @e[type=interaction,tag=--bbln.new,limit=1,x=0] ^ ^0.1875 ^-0.75 ~ ~
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,x=0] remove --bbln.new

function bubblellaneous:block/security_monitor/blockstates/place

execute summon text_display run data merge entity @s {Tags: ["+bubblellaneous", "bbln.text", "--bbln.new"], width: 1f, height: 1f, text: "", shadow: 1b, background: 0, transformation: {scale: [0.33f, 0.33f, 0.33f]}, Rotation: [0f, 0f]}
data modify entity @e[type=text_display,tag=--bbln.new,limit=1,x=0] text set from entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.camera.name
execute align xyz positioned ~0.5 ~ ~0.5 run tp @e[type=text_display,tag=--bbln.new,limit=1,x=0] ^ ^0.75 ^-0.31 ~ ~
scoreboard players operation @e[type=text_display,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=text_display,tag=--bbln.new,limit=1,x=0] remove --bbln.new
