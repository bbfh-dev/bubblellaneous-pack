execute unless data entity @s RootVehicle at @s run function bubblellaneous:block/ladder/leave

execute as @s[tag=--input-forward] run function bubblellaneous:block/ladder/internal/holding_w
execute as @s[tag=--input-backwards] run function bubblellaneous:block/ladder/internal/holding_s
# execute store result score x local.tmp run data get entity @s Motion[0] 1000
# execute store result score z local.tmp run data get entity @s Motion[2] 1000

# scoreboard players set proceed local.tmp 1
# execute if score x local.tmp matches 0 if score z local.tmp matches 0 run scoreboard players set proceed local.tmp 0
# execute if score proceed local.tmp matches 1 run function bubblellaneous:block/ladder/internal/read_keystokes
