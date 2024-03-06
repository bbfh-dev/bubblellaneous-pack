#region Summon the display
$summon item_display ~ ~ ~ {Tags: ["+bubblellaneous", "local.block", "local.name.$(name)", "--local.new"], item: {id: "$(base_item)", Count:1b, tag:{CustomModelData: $(custom_model_data)}}, width: 1f, height: 1f}
data modify entity @e[type=item_display,tag=--local.new,limit=1,sort=nearest] transformation set value {translation: [0f, 0f, 0f], scale: [1.02f, 1.02f, 1.02f], left_rotation: [0f, 0f, 0f, 1f], right_rotation: [0f, 0f, 0f, 1f]}
data modify entity @e[type=item_display,tag=--local.new,limit=1,sort=nearest] item.tag.bubblellaneous set from entity @s Item.tag.bubblellaneous
#endregion

#region Place base block
$setblock ~ ~ ~ $(base)
$execute if block ~ ~ ~ #bubblellaneous:container run data modify block ~ ~ ~ CustomName set value '$(display_name)'
$playsound bubblellaneous:block.$(sound).place block @a ~ ~ ~ 1 1 0
#endregion

#region Settings
execute if score global.increased_view_range local.settings matches 1 run data modify entity @e[type=item_display,tag=--local.new,limit=1,sort=nearest] view_range set value 1000f
#endregion

#region Facing
$data modify storage bubblellaneous tmp.in.facing set value "$(facing)"
execute if data storage bubblellaneous tmp.in{facing: "player"} facing entity @p[gamemode=!spectator] feet store result storage bubblellaneous tmp.in.rotation_x int 1 run function bubblellaneous:placer/internal/facing/player

execute as @e[type=item_display,tag=--local.new,limit=1,sort=nearest] run function bubblellaneous:utils/block/set_rotation with storage bubblellaneous tmp.in
#endregion

#region Tags
execute as @s[tag=--local.uses.brightness_fix] run data modify entity @e[type=item_display,tag=--local.new,limit=1,sort=nearest] brightness set value {block: 15, sky: 15}
execute as @s[tag=--local.uses.place] as @e[type=item_display,tag=--local.new,limit=1,sort=nearest] at @s run function bubblellaneous:placer/internal/custom_place/run with entity @s item.tag.bubblellaneous.block_data
function bubblellaneous:utils/block/placer/copy_uses_tag {name: "gui"}
function bubblellaneous:utils/block/placer/copy_uses_tag {name: "tick"}
function bubblellaneous:utils/block/placer/copy_uses_tag {name: "no_base"}
#endregion

tag @e[type=item_display,tag=--local.new,limit=1,sort=nearest] remove --local.new
