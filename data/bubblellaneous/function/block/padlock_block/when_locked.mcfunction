execute unless items entity @a[tag=--bbln.event_player,limit=1,x=0] weapon.mainhand *[custom_data~{bubblellaneous: {item_data: {name: "key"}}}] run return run function bubblellaneous:block/padlock_block/internal/wrong_key with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data.material

execute store result score #index_has bbln.tmp run data get entity @a[tag=--bbln.event_player,limit=1,x=0] SelectedItem.components."minecraft:custom_data".bubblellaneous.item_data.material.index
$scoreboard players set #index_require bbln.tmp $(index)
execute unless score #index_has bbln.tmp = #index_require bbln.tmp run return run function bubblellaneous:block/padlock_block/internal/wrong_key with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data.material

function bubblellaneous:blocks/kill
playsound bubblellaneous:block.lock.unlock block @a[distance=..16] ~ ~ ~ 0.25 1 0
