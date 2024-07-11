summon interaction ~ ~-0.51 ~ {Tags: ["+bubblellaneous", "local.padlock", "local.base", "--local.new"], width: 1.02f, height: 2.02f, response: 1b}
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1] remove --local.new

execute if score padlock.set_index local.tmp matches 0.. run scoreboard players set @s local.block_state 1

execute if block ~ ~ ~ #doors[hinge=right] run function bubblellaneous:block/padlock_block/blockstates/apply/left {rotation: 0}
execute if block ~ ~ ~ #doors[hinge=left] run function bubblellaneous:block/padlock_block/blockstates/apply/right {rotation: 0}
