#region Latch
summon item_display ~ ~ ~ {Tags: ["+bubblellaneous", "local.hatch", "--local.new_child"], item: {id: "item_frame", count: 1b}}

data modify entity @e[type=item_display,tag=--local.new_child,limit=1,sort=nearest] item.components set from entity @s item.components
execute as @e[type=item_display,tag=--local.new_child,limit=1,sort=nearest] at @s run function bubblellaneous:block/hatch/blockstates/apply/latch {rotation: 0}
scoreboard players operation @e[type=item_display,tag=--local.new_child,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=item_display,tag=--local.new_child,limit=1,sort=nearest] remove --local.new_child
#endregion

#region Interaction
summon interaction ~ ~-0.51 ~ {Tags: ["+bubblellaneous", "local.hatch", "local.base", "--local.new"], width: 1.01f, height: 0.52f, response: 1b}

scoreboard players operation @e[type=interaction,tag=--local.new,limit=1,sort=nearest] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1,sort=nearest] remove --local.new
#endregion

function bubblellaneous:block/hatch/blockstates/apply/rim {rotation: 0}
setblock ~ ~ ~ petrified_oak_slab[type=bottom]
