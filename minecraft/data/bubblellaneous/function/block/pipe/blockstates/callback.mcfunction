execute store result score rotation local.tmp run data get entity @s Rotation[0]

execute if score @s local.block.model matches 0 run return run setblock ~ ~ ~ lightning_rod[facing=up]
execute if score @s local.block.model matches 1 if score rotation local.tmp matches 0 run return run setblock ~ ~ ~ lightning_rod[facing=north]
execute if score @s local.block.model matches 1 if score rotation local.tmp matches -180 run return run setblock ~ ~ ~ lightning_rod[facing=north]
execute if score @s local.block.model matches 1 if score rotation local.tmp matches 180 run return run setblock ~ ~ ~ lightning_rod[facing=north]
execute if score @s local.block.model matches 1 if score rotation local.tmp matches 90 run return run setblock ~ ~ ~ lightning_rod[facing=east]
execute if score @s local.block.model matches 1 if score rotation local.tmp matches -90 run return run setblock ~ ~ ~ lightning_rod[facing=east]
setblock ~ ~ ~ conduit[waterlogged=false]
