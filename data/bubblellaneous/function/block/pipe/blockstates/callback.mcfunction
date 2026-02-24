scoreboard players operation #id_test bbln.tmp = @s bbln.block.id
execute as @e[type=minecraft:shulker,tag=bbln.shulker,predicate=bubblellaneous:check/block.id,distance=..0.5] at @s run function bubblellaneous:utils/delete_entity

execute store result score rotation bbln.tmp run data get entity @s Rotation[0]
execute if score @s bbln.block.model matches 0 run return run setblock ~ ~ ~ lightning_rod[facing=up]
execute if score @s bbln.block.model matches 1 if score rotation bbln.tmp matches 0 run return run setblock ~ ~ ~ lightning_rod[facing=north]
execute if score @s bbln.block.model matches 1 if score rotation bbln.tmp matches -180 run return run setblock ~ ~ ~ lightning_rod[facing=north]
execute if score @s bbln.block.model matches 1 if score rotation bbln.tmp matches 180 run return run setblock ~ ~ ~ lightning_rod[facing=north]
execute if score @s bbln.block.model matches 1 if score rotation bbln.tmp matches 90 run return run setblock ~ ~ ~ lightning_rod[facing=east]
execute if score @s bbln.block.model matches 1 if score rotation bbln.tmp matches -90 run return run setblock ~ ~ ~ lightning_rod[facing=east]
setblock ~ ~ ~ minecraft:structure_void
summon minecraft:text_display ~ ~-0.185 ~ {Tags:["+bubblellaneous", "bbln.shulker", "bbln.shulker_vehicle", "--bbln.new_child"],Passengers:[{id:"minecraft:shulker",Tags:["+bubblellaneous", "bbln.shulker", "--bbln.new_child"],Invulnerable:false,NoAI:true,Silent:true,DeathLootTable:"",attributes:[{id:"minecraft:scale",base:0.37d}],active_effects:[{id:"minecraft:resistance",duration:-1,amplifier:5b,show_particles:false},{id:"minecraft:invisibility",duration:-1,amplifier:0b,show_particles:false}]}]}
scoreboard players operation @e[type=#bubblellaneous:entity,tag=--bbln.new_child,distance=..0.5] bbln.block.id = #id_test bbln.tmp
tag @e[type=#bubblellaneous:entity,tag=--bbln.new_child,distance=..0.5] remove --bbln.new_child
