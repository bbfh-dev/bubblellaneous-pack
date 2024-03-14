scoreboard players set did_cancel local.tmp 0

#region Summon the display
$summon item_display ~ ~ ~ {Tags: ["+bubblellaneous", "local.block", "local.name.$(name)", "--local.new"], CustomName: '$(display_name)', item: {id: "$(base_item)", Count:1b, tag:{CustomModelData: $(custom_model_data)}}, width: 1f, height: 1f}
data modify entity @e[type=item_display,tag=--local.new,limit=1,sort=nearest] transformation set value {translation: [0f, 0f, 0f], scale: [1.02f, 1.02f, 1.02f], left_rotation: [0f, 0f, 0f, 1f], right_rotation: [0f, 0f, 0f, 1f]}
data modify entity @e[type=item_display,tag=--local.new,limit=1,sort=nearest] item.tag.bubblellaneous set from entity @s Item.tag.bubblellaneous
execute store result score @e[type=item_display,tag=--local.new,limit=1,sort=nearest] local.block.id run scoreboard players add block_id local.block.id 1
#endregion

#region Settings
execute if score global.increased_view_range local.settings matches 1 run data modify entity @e[type=item_display,tag=--local.new,limit=1,sort=nearest] view_range set value 1000f
#endregion

#region Facing
$data modify storage bubblellaneous tmp.in.facing set value "$(facing)"
execute store result score facing local.tmp run data get entity @s Facing

execute if data storage bubblellaneous tmp.in{facing: "player"} facing entity @p[gamemode=!spectator] feet store result storage bubblellaneous tmp.in.rotation_x int 1 run function bubblellaneous:block_placer/internal/facing/player
execute if data storage bubblellaneous tmp.in{facing: "normal"} store result storage bubblellaneous tmp.in.rotation_x int 1 run function bubblellaneous:block_placer/internal/facing/normal
execute if data storage bubblellaneous tmp.in{facing: "wall_normal"} store result storage bubblellaneous tmp.in.rotation_x int 1 run function bubblellaneous:block_placer/internal/facing/wall_normal
execute if data storage bubblellaneous tmp.in{facing: "door"} store result storage bubblellaneous tmp.in.rotation_x int 1 run function bubblellaneous:block_placer/internal/facing/door

execute as @e[type=item_display,tag=--local.new,limit=1,sort=nearest] run function bubblellaneous:utils/block/set_rotation with storage bubblellaneous tmp.in
execute if score did_cancel local.tmp matches 1 run return run kill @e[type=item_display,tag=--local.new,limit=1,sort=nearest]
#endregion

#region Place base block
$execute as @s[tag=!--local.uses.no_base] run setblock ~ ~ ~ $(base)
$execute if block ~ ~ ~ #bubblellaneous:container run data modify block ~ ~ ~ CustomName set value '$(display_name)'
$playsound bubblellaneous:block.$(sound).place block @a ~ ~ ~ 1 1 0
#endregion

#region Tags
execute as @s[tag=--local.uses.brightness_fix] run data modify entity @e[type=item_display,tag=--local.new,limit=1,sort=nearest] brightness set value {block: 15, sky: 15}
execute as @s[tag=--local.uses.no_base] as @e[type=item_display,tag=--local.new,limit=1,sort=nearest] at @s run function bubblellaneous:block/type_specific/no_base/place
execute as @s[tag=--local.uses.place] as @e[type=item_display,tag=--local.new,limit=1,sort=nearest] at @s run function bubblellaneous:block_placer/internal/custom_place/run with entity @s item.tag.bubblellaneous.block_data
function bubblellaneous:utils/block/placer/copy_uses_tag {name: "gui"}
function bubblellaneous:utils/block/placer/copy_uses_tag {name: "tick"}
function bubblellaneous:utils/block/placer/copy_uses_tag {name: "no_base"}
#endregion

tag @e[type=item_display,tag=--local.new,limit=1,sort=nearest] remove --local.new