execute store result score player.rotation local.tmp run data get entity @s Rotation[0]

function bubblellaneous:utils/setup_helper
execute store result entity @e[type=marker,tag=local.helper,limit=1] Pos[0] double 0.1 run scoreboard players get x local.tmp
execute store result entity @e[type=marker,tag=local.helper,limit=1] Pos[2] double 0.1 run scoreboard players get z local.tmp
execute as @e[type=marker,tag=local.helper,limit=1] at @s facing 0 0 0 run tp @s ~ ~ ~ ~180 ~

execute store result score vector.rotation local.tmp run data get entity @e[type=marker,tag=local.helper,limit=1] Rotation[0]
# scoreboard players operation player.rotation local.tmp -= vector.rotation local.tmp
scoreboard players operation vector.rotation local.tmp -= player.rotation local.tmp
execute if score vector.rotation local.tmp matches ..-1 run scoreboard players operation vector.rotation local.tmp *= -1 local.int
tag @s add --local.player
execute unless score vector.rotation local.tmp matches 100.. run function bubblellaneous:block/ladder/internal/holding_w
execute if score vector.rotation local.tmp matches 100.. run function bubblellaneous:block/ladder/internal/holding_s
tag @s remove --local.player
