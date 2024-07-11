execute summon item_display run data merge entity @s {Tags: ["+bubblellaneous", "local.display", "--local.new"], item: {id: "stone", count: 1b}, transformation: {scale: [0.6f, 0.6f, 0.6f], left_rotation: [0.674f, 0f, 0f, 0.738f], right_rotation: [0f, 0f, 0.060f, 0.998f], translation: [-0.1f, 0.04f, -0.1f]}, item_display: "gui", brightness: {sky: 15, block: 15}}

item replace entity @e[type=item_display,tag=--local.new,limit=1] container.0 from entity @p[tag=--local.event_player] weapon.mainhand
scoreboard players operation @e[type=item_display,tag=--local.new,limit=1] local.block.id = @s local.block.id
tag @e[type=item_display,tag=--local.new,limit=1] remove --local.new

# ------

execute summon item_display run data merge entity @s {Tags: ["+bubblellaneous", "local.display", "--local.new"], item: {id: "stone", count: 1b}, transformation: {scale: [0.6f, 0.6f, 0.6f], left_rotation: [0.753f, 0f, 0f, 0.658f], right_rotation: [0f, -0.090f, 0.779f, 0.621f], translation: [0.1f, 0.04f, 0.15f]}, item_display: "gui", brightness: {sky: 15, block: 15}}

item replace entity @e[type=item_display,tag=--local.new,limit=1] container.0 from entity @p[tag=--local.event_player] weapon.mainhand
scoreboard players operation @e[type=item_display,tag=--local.new,limit=1] local.block.id = @s local.block.id
tag @e[type=item_display,tag=--local.new,limit=1] remove --local.new
