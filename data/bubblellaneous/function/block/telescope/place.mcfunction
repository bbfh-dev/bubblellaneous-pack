summon interaction ~ ~-0.51 ~ {Tags: ["+bubblellaneous", "bbln.base", "bbln.base.telescope", "--bbln.new"], width: 1.51f, height: 2.02f, response: 1b}
scoreboard players operation @e[type=interaction,tag=--bbln.new,limit=1,x=0] bbln.block.id = @s bbln.block.id
tag @e[type=interaction,tag=--bbln.new,limit=1,x=0] remove --bbln.new

summon item_display ~ ~0.9 ~ {Tags: ["+bubblellaneous", "bbln.telescope_lens", "--bbln.new_child"], item: {id: "item_frame", count: 1b},teleport_duration:3}
data modify entity @e[type=item_display,tag=--bbln.new_child,limit=1,x=0] item.components set from entity @s item.components
scoreboard players operation @e[type=item_display,tag=--bbln.new_child,limit=1,x=0] bbln.block.id = @s bbln.block.id
execute as @e[type=item_display,tag=--bbln.new_child,limit=1,x=0] run function bubblellaneous:block_placer/internal/apply_blockstate {name: "optics", rotation: 0}
tp @e[type=item_display,tag=--bbln.new_child,limit=1,x=0] ^ ^0.9 ^ ~ ~
tag @e[type=item_display,tag=--bbln.new_child,limit=1,x=0] remove --bbln.new_child

function bubblellaneous:block_placer/internal/apply_blockstate {name: "stand", rotation: 0}
