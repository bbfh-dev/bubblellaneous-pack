execute store result storage bubblellaneous tmp.in.camera_id int 1 run scoreboard players get @s local.block.id
execute store result storage bubblellaneous tmp.in.pos_x int 1 run data get entity @s Pos[0]
execute store result storage bubblellaneous tmp.in.pos_y int 1 run data get entity @s Pos[1]
execute store result storage bubblellaneous tmp.in.pos_z int 1 run data get entity @s Pos[2]
data modify storage bubblellaneous tmp.in.dimension set from entity @p[tag=--local.event_player] Dimension
data modify storage bubblellaneous tmp.in.name set from entity @p[tag=--local.event_player] SelectedItem.components."minecraft:custom_name"

function bubblellaneous:block/surveillance_camera/link/apply_properties with storage bubblellaneous tmp.in

playsound bubblellaneous:block.lock.register block @a ~ ~ ~ 1 1 0
tellraw @p[tag=--local.event_player] {"translate":"ui.bubblellaneous.camera.registered", "color":"green", "with":[{"nbt":"SelectedItem.components.minecraft:item_name", "entity":"@p[tag=--local.event_player]", "interpret":true}]}
