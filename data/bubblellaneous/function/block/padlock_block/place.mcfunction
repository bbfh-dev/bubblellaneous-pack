tag @s remove --bbln.uses.no_base

summon interaction ~ ~-0.51 ~ {Tags: ["+bubblellaneous", "bbln.padlock", "bbln.base", "--bbln.new"], width: 1.02f, height: 2.02f, response: 1b}
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,x=0] remove --bbln.new

execute if score padlock.set_index bbln.tmp matches 0.. run scoreboard players set @s bbln.block_state 1

execute if block ~ ~ ~ #doors[hinge=right] run function bubblellaneous:block_placer/internal/apply_blockstate {name: "left", rotation: 0}
execute if block ~ ~ ~ #doors[hinge=left] run function bubblellaneous:block_placer/internal/apply_blockstate {name: "default", rotation: 0}
