$data merge entity @s {Tags: ["+bubblellaneous", "local.block"], CustomName:'$(display_name)', item: {id: "item_frame", Count: 1b, tag:{CustomModelData: $(custom_model_data), block_data:{id: "$(id)", sound: "$(sound)", base: "$(base)", name: "$(name)", facing: "$(facing)", custom_model_data: $(custom_model_data)}}}, brightness: {sky: 0, block: 15}, transformation: {translation: [0f, 0.5f, 0f], scale: [1.01f, 1.01f, 1.01f]}}
$tag @s add --local.name.$(id)

execute as @e[type=item_frame,tag=--local.this,limit=1] run function bubblellaneous:utils/block/placer/clear_tags
data modify entity @s Tags append from entity @e[type=item_frame,limit=1,sort=nearest] Tags[]

scoreboard players set @s local.block.state 0

scoreboard players set is_cancelled local.tmp 0
execute if data entity @s item.tag.block_data{facing: "player"} facing entity @p[gamemode=!spectator] feet store result storage bubblellaneous tmp.rotation int 1 run function bubblellaneous:utils/block/placer/facing/player
execute if data entity @s item.tag.block_data{facing: "wall"} store result storage bubblellaneous tmp.rotation int 1 run function bubblellaneous:utils/block/placer/facing/against_wall

execute if score is_cancelled local.tmp matches 1 run return 0

function bubblellaneous:utils/block/set_rotation with storage bubblellaneous tmp
execute store result score @s local.block.id run scoreboard players add id local.block.id 1

$execute as @s[tag=--local.uses.custom_place] at @s run function bubblellaneous:blocks/$(id)/place
execute as @s[tag=--local.uses.blockstates] at @s positioned ~ ~.1 ~ run function bubblellaneous:utils/block/placer/blockstates/update with entity @s item.tag.block_data
execute as @s[tag=--local.uses.no_base] at @s run setblock ~ ~ ~ air
