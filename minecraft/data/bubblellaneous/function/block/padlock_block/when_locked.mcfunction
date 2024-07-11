$execute unless entity @p[tag=--local.event_player,nbt={SelectedItem: {tag: {bubblellaneous: {item_data: {name: "key", material: {index: $(index)}}}}}}] run return run function bubblellaneous:block/padlock_block/internal/wrong_key with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data.material

function bubblellaneous:blocks/kill
playsound bubblellaneous:block.lock.unlock block @a ~ ~ ~ 1 1 0
