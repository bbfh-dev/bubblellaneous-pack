scoreboard players set did_cancel local.tmp 0
scoreboard players reset NO_REPLACE local.tmp

#region Summon the display
$summon item_display ~ ~ ~ {Tags: ["+bubblellaneous", "local.block", "local.name.$(name)", "--local.new"], CustomName: $(display_name), item: {id: "$(base_item)", count:1, components:{item_model:"bubblellaneous:$(id)"}, width: 1f, height: 1f}}
data modify entity @e[type=item_display,tag=--local.new,limit=1,sort=nearest] transformation set value {translation: [0f, 0f, 0f], scale: [1.001f, 1.001f, 1.001f], left_rotation: [0f, 0f, 0f, 1f], right_rotation: [0f, 0f, 0f, 1f]}
data modify entity @e[type=item_display,tag=--local.new,limit=1,sort=nearest] item.components.minecraft:custom_data.bubblellaneous set from entity @s Item.components.minecraft:custom_data.bubblellaneous
execute store result score @e[type=item_display,tag=--local.new,limit=1,sort=nearest] local.block.id run scoreboard players add block_id local.block.id 1
#endregion

scoreboard players set @e[type=item_display,tag=--local.new,limit=1,sort=nearest] local.block_state 0

#region Settings
execute if score global.increased_view_range local.settings matches 1 run data modify entity @e[type=item_display,tag=--local.new,limit=1,sort=nearest] view_range set value 1000f
#endregion

#region Facing
$data modify storage bubblellaneous tmp.in.facing set value "$(facing)"
execute store result score facing local.tmp run data get entity @s Facing

data modify storage bubblellaneous tmp.in.rotation_y set value 0
execute if data storage bubblellaneous tmp.in{facing: "player"} facing entity @p[gamemode=!spectator] feet store result storage bubblellaneous tmp.in.rotation_x int 1 run function bubblellaneous:block_placer/internal/facing/player
execute if data storage bubblellaneous tmp.in{facing: "player_precise"} facing entity @p[gamemode=!spectator] feet store result storage bubblellaneous tmp.in.rotation_x int 1 run function bubblellaneous:block_placer/internal/facing/player_precise
execute if data storage bubblellaneous tmp.in{facing: "normal"} store result storage bubblellaneous tmp.in.rotation_x int 1 run function bubblellaneous:block_placer/internal/facing/normal
execute if data storage bubblellaneous tmp.in{facing: "wall_normal"} store result storage bubblellaneous tmp.in.rotation_x int 1 run function bubblellaneous:block_placer/internal/facing/wall_normal
execute if data storage bubblellaneous tmp.in{facing: "door"} store result storage bubblellaneous tmp.in.rotation_x int 1 run function bubblellaneous:block_placer/internal/facing/door
execute if data storage bubblellaneous tmp.in{facing: "none"} run data modify storage bubblellaneous tmp.in.rotation_x set value 0

execute as @e[type=item_display,tag=--local.new,limit=1,sort=nearest] run function bubblellaneous:utils/block/set_rotation with storage bubblellaneous tmp.in
execute if score did_cancel local.tmp matches 1 run return run kill @e[type=item_display,tag=--local.new,limit=1,sort=nearest]

execute store result entity @e[type=item_display,tag=--local.new,limit=1,sort=nearest] item.components."minecraft:custom_data".bubblellaneous.block_properties.rotation int 1 run data get storage bubblellaneous tmp.in.rotation_x
#endregion

#region Place base block
$execute as @s[tag=!--local.uses.no_base] run setblock ~ ~ ~ $(base)
$execute if block ~ ~ ~ #bubblellaneous:container run data modify block ~ ~ ~ CustomName set value $(display_name)
$playsound bubblellaneous:block.$(sound).place block @a ~ ~ ~ 1 1 0
#endregion

#region Tags
function bubblellaneous:utils/block/placer/copy_uses_tag {name: "gui"}
function bubblellaneous:utils/block/placer/copy_uses_tag {name: "tick"}
function bubblellaneous:utils/block/placer/copy_uses_tag {name: "no_base"}
function bubblellaneous:utils/block/placer/copy_uses_tag {name: "timer"}
function bubblellaneous:utils/block/placer/copy_uses_tag {name: "blockstates"}
function bubblellaneous:utils/block/placer/copy_uses_tag {name: "blockstate_callback"}
execute as @s[tag=--local.uses.brightness_fix] run data modify entity @e[type=item_display,tag=--local.new,limit=1,sort=nearest] brightness set value {block: 15, sky: 15}
execute as @s[tag=--local.uses.no_base,tag=!--local.uses.custom_base] as @e[type=item_display,tag=--local.new,limit=1,sort=nearest] at @s run function bubblellaneous:blocks/type_specific/no_base/place with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data
execute as @s[tag=--local.uses.place] as @e[type=item_display,tag=--local.new,limit=1,sort=nearest] at @s run function bubblellaneous:block_placer/internal/custom_place/run with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data
execute as @s[tag=--local.uses.blockstates] as @e[type=item_display,tag=--local.new,limit=1,sort=nearest] at @s run function bubblellaneous:block_placer/internal/initial_update_blockstates with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data
#endregion

tag @e[type=item_display,tag=--local.new,limit=1,sort=nearest] remove --local.new
execute as @e[type=item_display,tag=--local.new,limit=1,sort=nearest] at @s run function #bubblellaneous:block/all/on_place
