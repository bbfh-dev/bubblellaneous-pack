setblock ~ ~ ~ air
setblock ~ ~ ~ barrel[facing=up]

execute if score @s bbln.block.timer matches 1.. run return 0
execute if items entity @a[tag=--bbln.event_player,limit=1,x=0] armor.head #bubblellaneous:retina_scanner_dislike run return run function bubblellaneous:block/retina_scanner/error

function bubblellaneous:block_placer/internal/apply_blockstate {name: "scan", rotation: 0}
function bubblellaneous:block/retina_scanner/get_uuid
execute if score @s bbln.block_state matches 0 run return run function bubblellaneous:block/retina_scanner/set_credentials

execute store result score #player_uuid.0 bbln.tmp run data get storage bubblellaneous tmp.uuid[0]
execute store result score #player_uuid.1 bbln.tmp run data get storage bubblellaneous tmp.uuid[1]
execute store result score #player_uuid.2 bbln.tmp run data get storage bubblellaneous tmp.uuid[2]
execute store result score #player_uuid.3 bbln.tmp run data get storage bubblellaneous tmp.uuid[3]

execute store result score #owner_uuid.0 bbln.tmp run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.owner_uuid[0]
execute store result score #owner_uuid.1 bbln.tmp run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.owner_uuid[1]
execute store result score #owner_uuid.2 bbln.tmp run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.owner_uuid[2]
execute store result score #owner_uuid.3 bbln.tmp run data get entity @s item.components."minecraft:custom_data".bubblellaneous.block_properties.owner_uuid[3]

execute if score #player_uuid.0 bbln.tmp = #owner_uuid.0 bbln.tmp if score #player_uuid.1 bbln.tmp = #owner_uuid.1 bbln.tmp if score #player_uuid.2 bbln.tmp = #owner_uuid.2 bbln.tmp if score #player_uuid.3 bbln.tmp = #owner_uuid.3 bbln.tmp run return run function bubblellaneous:block/retina_scanner/open
function bubblellaneous:block/retina_scanner/error
