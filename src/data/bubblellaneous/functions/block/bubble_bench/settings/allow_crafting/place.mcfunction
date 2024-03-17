execute positioned ~ ~-1 ~ run function place:bubblellaneous/bubble_bench
execute as @s[nbt={Item: {Count: 1b}}] run return run kill @s

execute store result score value local.tmp run data get entity @s Item.Count
execute store result entity @s Item.Count byte 1 run scoreboard players remove value local.tmp 1
