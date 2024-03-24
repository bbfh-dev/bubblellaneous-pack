scoreboard players operation block_state local.tmp = @s local.block_state
execute unless score block_state local.tmp matches 1 run scoreboard players set @s local.block_state 1
execute if score block_state local.tmp matches 1 run scoreboard players set @s local.block_state 0

execute if score block_state local.tmp matches 1 run function bubblellaneous:block/curtains/internal/neighbors/close
execute if score block_state local.tmp matches 0 run function bubblellaneous:block/curtains/internal/neighbors/open
tag @e[type=item_display] remove --local.cached

playsound entity.horse.armor block @a ~ ~ ~ 0.5 1.5 0
