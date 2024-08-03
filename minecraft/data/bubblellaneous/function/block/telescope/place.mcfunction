summon interaction ~ ~-0.51 ~ {Tags: ["+bubblellaneous", "local.base", "local.base.telescope", "--local.new"], width: 1.51f, height: 2.02f, response: 1b}
scoreboard players operation @e[type=interaction,tag=--local.new,limit=1] local.block.id = @s local.block.id
tag @e[type=interaction,tag=--local.new,limit=1] remove --local.new

summon item_display ~ ~.9 ~ {Tags: ["+bubblellaneous", "local.telescope_lens", "--local.new_child"], item: {id: "item_frame", count: 1b}}
data modify entity @e[type=item_display,tag=--local.new_child,limit=1,sort=nearest] item.components set from entity @s item.components
data modify entity @e[type=item_display,tag=--local.new_child,limit=1,sort=nearest] teleport_duration set value 3
scoreboard players operation @e[type=item_display,tag=--local.new_child,limit=1] local.block.id = @s local.block.id
execute as @e[type=item_display,tag=--local.new_child,limit=1] run function bubblellaneous:block/telescope/blockstates/apply/optics {rotation: 0}
tp @e[type=item_display,tag=--local.new_child,limit=1] ^ ^.9 ^ ~ ~
tag @e[type=item_display,tag=--local.new_child,limit=1] remove --local.new_child

function bubblellaneous:block/telescope/blockstates/apply/stand {rotation: 0}
