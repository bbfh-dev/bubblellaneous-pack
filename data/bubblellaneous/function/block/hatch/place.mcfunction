#region Latch
summon item_display ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.hatch", "--bbln.new_child"], item: {id: "item_frame", count: 1b},interpolation_duration:5}

data modify entity @e[type=item_display,tag=--bbln.new_child,limit=1,x=0] item.components set from entity @s item.components
rotate @e[type=item_display,tag=--bbln.new_child,limit=1,x=0] ~ ~
execute as @e[type=item_display,tag=--bbln.new_child,limit=1,x=0] at @s run function bubblellaneous:block_placer/internal/apply_blockstate {name: "latch", rotation: 0}
scoreboard players operation @e[type=item_display,tag=--bbln.new_child,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=item_display,tag=--bbln.new_child,limit=1,x=0] remove --bbln.new_child
#endregion

#region Interaction
summon interaction ~ ~-0.51 ~ {Tags: ["+bubblellaneous", "bbln.hatch", "bbln.base", "--bbln.new"], width: 1.01f, height: 0.52f, response: 1b}

scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
rotate @e[type=item_display,tag=--bbln.new,limit=1,x=0] ~ ~
tag @e[type=interaction,tag=--bbln.new,limit=1,x=0] remove --bbln.new
#endregion

execute rotated as @s run function bubblellaneous:block_placer/internal/apply_blockstate {name: "rim", rotation: 0}
#setblock ~ ~ ~ petrified_oak_slab[type=bottom]
