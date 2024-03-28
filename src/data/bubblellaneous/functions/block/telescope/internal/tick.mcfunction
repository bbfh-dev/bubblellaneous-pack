execute facing entity @p[tag=--local.player] eyes run tp @s ~ ~ ~ ~ ~
execute at @p[tag=--local.player] rotated as @s run tp @p[tag=--local.player] ^ ^ ^ ~ ~
execute store result score rotation local.tmp run data get entity @s Rotation[1]
execute if score rotation local.tmp matches ..-40 rotated ~ -38 run function bubblellaneous:block/telescope/internal/limit_y {y: -1}
execute if score rotation local.tmp matches 40.. rotated ~ 38 run function bubblellaneous:block/telescope/internal/limit_y {y: 1}

#region Check that player didn't hit a block
scoreboard players set limit local.tmp 256
scoreboard players set hit_block local.tmp 0
scoreboard players set hit_player local.tmp 0
execute at @s run function bubblellaneous:block/telescope/internal/raycast
execute if score hit_block local.tmp matches 0 run effect clear @p[tag=--local.player] blindness
execute if score hit_block local.tmp matches 1 run effect give @p[tag=--local.player] blindness 2 0 true
execute if score hit_player local.tmp matches 0 unless entity @p[tag=--local.player,distance=..254] at @s run tp @p[tag=--local.player] ^ ^-1 ^254 ~ ~
#endregion

scoreboard players set distance local.tmp 256
scoreboard players operation distance local.tmp -= limit local.tmp
title @p[tag=--local.player] actionbar ["⏴ ", {"score":{"name": "distance", "objective": "local.tmp"}, "color":"yellow"}, "/256 ⏵"]

execute positioned ~ ~-0.5 ~ if entity @p[tag=--local.player,distance=..5] run function bubblellaneous:block/telescope/quit with entity @p[tag=--local.player]
