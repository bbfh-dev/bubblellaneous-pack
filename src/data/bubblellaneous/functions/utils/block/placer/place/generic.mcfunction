$data merge entity @s {Tags: ["+bubblellaneous", "local.block"], CustomName:'$(display_name)', item: {id: "item_frame", Count: 1b, tag:{CustomModelData: $(custom_model_data), block_data:{id: "$(id)", sound: "$(sound)", base: "$(base)", name: "$(name)", facing: "$(facing)", custom_model_data: $(custom_model_data), material_count: $(material_count)}}}, transformation: {translation: [0f, 0.5f, 0f], scale: [1.01f, 1.01f, 1.01f]}}
scoreboard players operation @s local.block.facing = facing local.tmp
$tag @s add --local.name.$(id)

execute as @e[type=item_frame,tag=--local.this,limit=1] run function bubblellaneous:utils/block/placer/clear_tags
data modify entity @s Tags append from entity @e[type=item_frame,limit=1,sort=nearest] Tags[]
data modify entity @s[tag=--local.uses.brightness_fix] brightness set value {sky: 0, block: 15}

scoreboard players set @s local.block.state 0
scoreboard players set @s local.block.model 0

scoreboard players set is_cancelled local.tmp 0
execute as @s[nbt={item: {tag: {block_data: {facing: "player"}}}}] facing entity @p[gamemode=!spectator] feet store result storage bubblellaneous tmp.rotation int 1 run function bubblellaneous:utils/block/placer/facing/player
execute as @s[nbt={item: {tag: {block_data: {facing: "wall"}}}}] store result storage bubblellaneous tmp.rotation int 1 run function bubblellaneous:utils/block/placer/facing/against_wall
execute as @s[nbt={item: {tag: {block_data: {facing: "surface"}}}}] store result storage bubblellaneous tmp.rotation int 1 run function bubblellaneous:utils/block/placer/facing/against_surface
execute as @s[nbt={item: {tag: {block_data: {facing: "door"}}}}] store result storage bubblellaneous tmp.rotation int 1 run function bubblellaneous:utils/block/placer/facing/door

execute if score is_cancelled local.tmp matches 1 run return 0

function bubblellaneous:utils/block/set_rotation with storage bubblellaneous tmp
execute store result score @s local.block.id run scoreboard players add id local.block.id 1

execute as @s[tag=--local.uses.all_dimensions] unless score @s local.block.facing matches 3 at @s run function bubblellaneous:utils/block/rotate/north
execute as @s[tag=--local.uses.blockstates] at @s positioned ~ ~.1 ~ run function bubblellaneous:utils/block/placer/blockstates/update with entity @s item.tag.block_data
$execute as @s[tag=--local.uses.custom_place] at @s run function bubblellaneous:blocks/$(id)/place
