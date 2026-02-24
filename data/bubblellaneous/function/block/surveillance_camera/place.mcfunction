summon item_display ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.camera", "--bbln.new_child"], item: {id: "item_frame", count: 1b}}

data modify entity @e[type=item_display,tag=--bbln.new_child,limit=1,x=0] item.components set from entity @s item.components
data modify entity @e[type=item_display,tag=--bbln.new_child,limit=1,x=0] teleport_duration set value 3
execute as @e[type=item_display,tag=--bbln.new_child,limit=1,x=0] at @s run function bubblellaneous:block_placer/internal/apply_blockstate {name: "camera", rotation: 0}
execute facing entity @p[gamemode=!spectator] feet run tp @e[type=item_display,tag=--bbln.new_child,limit=1,x=0] ~ ~ ~ ~ 0
scoreboard players operation @e[type=item_display,tag=--bbln.new_child,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=item_display,tag=--bbln.new_child,limit=1,x=0] remove --bbln.new_child

function bubblellaneous:block_placer/internal/apply_blockstate {name: "stand", rotation: 0}
