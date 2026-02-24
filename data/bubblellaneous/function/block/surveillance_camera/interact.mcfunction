data modify storage bubblellaneous tmp.in set value {id: 0, name: "", location: {dimension: "", x: 0, y: 0, z: 0}}
execute store result storage bubblellaneous tmp.in.id int 1 run scoreboard players get @s bbln.block.id
execute store result storage bubblellaneous tmp.in.location.x int 1 run data get entity @s Pos[0]
execute store result storage bubblellaneous tmp.in.location.y int 1 run data get entity @s Pos[1]
execute store result storage bubblellaneous tmp.in.location.z int 1 run data get entity @s Pos[2]
data modify storage bubblellaneous tmp.in.location.dimension set from entity @a[tag=--bbln.event_player,limit=1,x=0] Dimension
data modify storage bubblellaneous tmp.in.name set from entity @a[tag=--bbln.event_player,limit=1,x=0] SelectedItem.components."minecraft:custom_name"
execute unless data storage bubblellaneous tmp.in.name run data modify storage bubblellaneous tmp.in.name set value {"translate":"item.bubblellaneous.default_camera","fallback":"Default Camera"}

execute summon minecraft:item_display run function bubblellaneous:block/surveillance_camera/link/apply_properties

playsound bubblellaneous:block.lock.register block @a[distance=..16] ~ ~ ~ 0.25 1 0
tellraw @a[tag=--bbln.event_player,limit=1,x=0] {"translate":"ui.bubblellaneous.camera.registered", "color":"green", "with":[{"nbt":"SelectedItem.components.minecraft:item_name", "entity":"@a[tag=--bbln.event_player,limit=1,x=0]", "interpret":true}]}

