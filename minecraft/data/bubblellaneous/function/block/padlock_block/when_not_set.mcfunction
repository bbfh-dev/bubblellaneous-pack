execute unless entity @p[tag=--local.event_player,nbt={SelectedItem: {components: {"minecraft:custom_data": {bubblellaneous: {item_data: {name: "key"}}}}}}] run return run function bubblellaneous:block/padlock_block/internal/no_key_to_lock

function bubblellaneous:block/padlock_block/internal/place_new with entity @p[tag=--local.event_player] SelectedItem.components."minecraft:custom_data".bubblellaneous.item_data.material

playsound block.chest.locked block @a ~ ~ ~ 1 1 0

function bubblellaneous:blocks/kill
