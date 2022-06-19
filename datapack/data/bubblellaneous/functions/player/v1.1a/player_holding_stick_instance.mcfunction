execute store result score #_UUID0 bubblellaneous run data get entity @s UUID[0]
execute store result score #_UUID1 bubblellaneous run data get entity @s UUID[1]
execute store result score #_UUID2 bubblellaneous run data get entity @s UUID[2]
execute store result score #_UUID3 bubblellaneous run data get entity @s UUID[3]
execute if score #_UUID0 bubblellaneous = #UUID0 bubblellaneous if score #_UUID1 bubblellaneous = #UUID1 bubblellaneous if score #_UUID2 bubblellaneous = #UUID2 bubblellaneous if score #_UUID3 bubblellaneous = #UUID3 bubblellaneous if entity @s[tag=bubblellaneous] run scoreboard players set #Success bubblellaneous 1