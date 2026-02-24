setblock ~ ~ ~ air strict
setblock ~ ~ ~ barrel[facing=up,open=false] strict
stopsound @a[distance=..16] block minecraft:block.barrel.open

execute if score @s bbln.block.timer matches 1.. run return 0
execute unless items entity @a[tag=--bbln.event_player,limit=1,x=0] weapon.mainhand * run return 1
function bubblellaneous:block_placer/internal/apply_blockstate {name: "scan", rotation: 0}
execute if score @s bbln.block_state matches 0 run return run function bubblellaneous:block/item_scanner/set_credentials

data modify storage bubblellaneous tmp.compare set from entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.lock_item
execute store success score #success.0 bbln.tmp run data modify storage bubblellaneous tmp.compare.id set from entity @a[tag=--bbln.event_player,limit=1,x=0] SelectedItem.id
execute store success score #success.1 bbln.tmp run data modify storage bubblellaneous tmp.compare.components set from entity @a[tag=--bbln.event_player,limit=1,x=0] SelectedItem.components

execute if score #success.0 bbln.tmp matches 0 if score #success.1 bbln.tmp matches 0 run return run function bubblellaneous:block/item_scanner/open
function bubblellaneous:block/item_scanner/error
