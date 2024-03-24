data merge entity @s {Tags: ["+bubblellaneous", "local.display_item"], item: {id: "stone", Count: 1b}, transformation: {scale: [0.6f, 0.6f, 0.6f], left_rotation: [-0.707f, 0f, 0f, 0.707f], right_rotation: [0f, 0f, -0.150f, 0.989f], translation: [0f, 0.02f, 0f]}, item_display: "gui", brightness: {sky: 15, block: 15}}
scoreboard players operation @s local.block.id = @e[type=interaction,tag=--local.this,limit=1] local.block.id

execute store result score count local.tmp run data get entity @p[tag=--local.event_player] SelectedItem.Count
execute if score count local.tmp matches 8.. run function bubblellaneous:blocks/type_specific/shelf/internal/place_a_pile_of_items

item replace entity @s container.0 from entity @p[tag=--local.event_player] weapon.mainhand
item replace entity @p[tag=--local.event_player] weapon.mainhand with air
