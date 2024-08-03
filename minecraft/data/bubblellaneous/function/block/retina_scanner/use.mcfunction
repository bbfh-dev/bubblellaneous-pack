setblock ~ ~ ~ air
setblock ~ ~ ~ barrel[facing=up]

execute if score @s local.block.timer matches 1.. run return 0
execute if entity @p[tag=--local.event_player,nbt={Inventory: [{Slot: 103b, id: "minecraft:zombie_head"}]}] run return run function bubblellaneous:block/retina_scanner/error
execute if entity @p[tag=--local.event_player,nbt={Inventory: [{Slot: 103b, id: "minecraft:creeper_head"}]}] run return run function bubblellaneous:block/retina_scanner/error
execute if entity @p[tag=--local.event_player,nbt={Inventory: [{Slot: 103b, id: "minecraft:piglin_head"}]}] run return run function bubblellaneous:block/retina_scanner/error
execute if entity @p[tag=--local.event_player,nbt={Inventory: [{Slot: 103b, id: "minecraft:dragon_head"}]}] run return run function bubblellaneous:block/retina_scanner/error

function bubblellaneous:block/retina_scanner/blockstates/apply/scan {rotation: 0}
execute if score @s local.block_state matches 0 run return run function bubblellaneous:block/retina_scanner/set_credentials

function bubblellaneous:block/retina_scanner/get_uuid
execute store result score player_uuid.0 local.tmp run data get storage bubblellaneous tmp.uuid[0]
execute store result score player_uuid.1 local.tmp run data get storage bubblellaneous tmp.uuid[1]
execute store result score player_uuid.2 local.tmp run data get storage bubblellaneous tmp.uuid[2]
execute store result score player_uuid.3 local.tmp run data get storage bubblellaneous tmp.uuid[3]

execute store result score owner_uuid.0 local.tmp run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.owner_uuid[0]
execute store result score owner_uuid.1 local.tmp run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.owner_uuid[1]
execute store result score owner_uuid.2 local.tmp run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.owner_uuid[2]
execute store result score owner_uuid.3 local.tmp run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.owner_uuid[3]

scoreboard players set do_open local.tmp 0
execute if score player_uuid.0 local.tmp = owner_uuid.0 local.tmp if score player_uuid.1 local.tmp = owner_uuid.1 local.tmp if score player_uuid.2 local.tmp = owner_uuid.2 local.tmp if score player_uuid.3 local.tmp = owner_uuid.3 local.tmp run scoreboard players set do_open local.tmp 1

execute if score do_open local.tmp matches 0 run function bubblellaneous:block/retina_scanner/error
execute if score do_open local.tmp matches 1 run function bubblellaneous:block/retina_scanner/open
