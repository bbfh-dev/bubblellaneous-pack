data merge entity @s {Tags: ["+bubblellaneous", "local.display_item"], item: {id: "stone", Count: 1b}, transformation: {scale: [0.6f, 0.6f, 0.6f], left_rotation: [-0.707f, 0f, 0f, 0.707f], right_rotation: [0f, 0f, -0.150f, 0.989f], translation: [0f, 0.02f, 0f]}, item_display: "gui"}
data modify entity @s[tag=--local.uses.brightness_fix] brightness set value {sky: 7, block: 7}
scoreboard players operation @s local.block.id = @e[type=interaction,tag=--local.this,limit=1] local.block.id

item replace entity @s container.0 from entity @p[tag=--local.player] weapon.mainhand
item replace entity @p[tag=--local.player] weapon.mainhand with air
