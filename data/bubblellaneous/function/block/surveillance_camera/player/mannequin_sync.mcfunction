tag @s remove --bbln.camera.leaving
tp @s @e[type=minecraft:mannequin,tag=bbln.dummy_player,predicate=bubblellaneous:check/player.id,limit=1,x=0]
execute as @e[type=minecraft:mannequin,tag=bbln.dummy_player,predicate=bubblellaneous:check/player.id,limit=1,x=0] at @s run function bubblellaneous:utils/delete_entity

execute if entity @s[tag=--bbln.camera.cancel] run function bubblellaneous:block/surveillance_camera/link/leave_finish

