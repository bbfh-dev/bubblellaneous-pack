execute unless items entity @a[tag=--bbln.event_player,limit=1,x=0] weapon.mainhand *[custom_data~{bubblellaneous: {item_data: {name: "key"}}}] run return run function bubblellaneous:block/padlock_block/internal/no_key_to_lock

function bubblellaneous:block/padlock_block/internal/place_new with entity @a[tag=--bbln.event_player,limit=1,x=0] SelectedItem.components."minecraft:custom_data".bubblellaneous.item_data.material

playsound block.chest.locked block @a[distance=..16] ~ ~ ~ 0.25 1 0

function bubblellaneous:blocks/kill
