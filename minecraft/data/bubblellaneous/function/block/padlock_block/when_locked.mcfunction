execute unless entity @p[tag=--local.event_player,nbt={SelectedItem: {components: {"minecraft:custom_data": {bubblellaneous: {item_data: {name: "key"}}}}}}] run return run function bubblellaneous:block/padlock_block/internal/wrong_key with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data.material

execute store result score index_has local.tmp run data get entity @p[tag=--local.event_player] SelectedItem.components."minecraft:custom_data".bubblellaneous.item_data.material.index
$scoreboard players set index_require local.tmp $(index)
execute unless score index_has local.tmp = index_require local.tmp run return run function bubblellaneous:block/padlock_block/internal/wrong_key with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data.material

function bubblellaneous:blocks/kill
playsound bubblellaneous:block.lock.unlock block @a ~ ~ ~ 1 1 0
