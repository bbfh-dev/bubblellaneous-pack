setblock ~ ~ ~ air
setblock ~ ~ ~ barrel[facing=up]

execute if score @s local.block.timer matches 1.. run return 0
execute unless data entity @p[tag=--local.event_player] SelectedItem.id run return 1
function bubblellaneous:block/item_scanner/blockstates/apply/scan {rotation: 0}
execute if score @s local.block_state matches 0 run return run function bubblellaneous:block/item_scanner/set_credentials

data modify storage bubblellaneous tmp.compare set from entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.lock_item
execute store success score success.0 local.tmp run data modify storage bubblellaneous tmp.compare.id set from entity @p[tag=--local.event_player] SelectedItem.id
execute store success score success.1 local.tmp run data modify storage bubblellaneous tmp.compare.tag set from entity @p[tag=--local.event_player] SelectedItem.tag

scoreboard players set do_open local.tmp 0
execute if score success.0 local.tmp matches 0 if score success.1 local.tmp matches 0 run scoreboard players set do_open local.tmp 1

execute if score do_open local.tmp matches 0 run function bubblellaneous:block/item_scanner/error
execute if score do_open local.tmp matches 1 run function bubblellaneous:block/item_scanner/open
