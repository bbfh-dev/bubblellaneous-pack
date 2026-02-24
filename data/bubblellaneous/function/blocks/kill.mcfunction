scoreboard players operation #id_test bbln.tmp = @s bbln.block.id
execute if entity @s[tag=+bubblellaneous] run function bubblellaneous:utils/delete_entity
execute as @e[type=#bubblellaneous:entity,tag=+bubblellaneous,predicate=bubblellaneous:check/block.id,distance=..5] run function bubblellaneous:utils/delete_entity
