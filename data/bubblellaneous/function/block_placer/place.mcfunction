scoreboard players set #did_cancel bbln.tmp 0
scoreboard players reset NO_REPLACE bbln.tmp

#region Summon the display
$summon item_display ~ ~ ~ {Tags: ["+bubblellaneous", "bbln.block", "bbln.name.$(name)", "--bbln.new"], CustomName: $(display_name), item: {id: "$(base_item)", count:1, components:{item_model:"bubblellaneous:$(id)"}}, width: 1f, height: 1f}
data modify entity @e[type=item_display,tag=--bbln.new,limit=1,x=0] transformation set value {translation: [0f, 0f, 0f], scale: [1.004f, 1.004f, 1.004f], left_rotation: [0f, 0f, 0f, 1f], right_rotation: [0f, 0f, 0f, 1f]}
data modify entity @e[type=item_display,tag=--bbln.new,limit=1,x=0] item.components.minecraft:custom_data.bubblellaneous set from entity @s Item.components.minecraft:custom_data.bubblellaneous
execute store result score @e[type=item_display,tag=--bbln.new,limit=1,x=0] bbln.block.id run scoreboard players add #block_id bbln.block.id 1
#endregion

scoreboard players set @e[type=item_display,tag=--bbln.new,limit=1,x=0] bbln.block_state 0

#region Settings
execute if score #global.increased_view_range bbln.settings matches 1 run data modify entity @e[type=item_display,tag=--bbln.new,limit=1,x=0] view_range set value 1000f
#endregion

#region Facing
$data modify storage bubblellaneous tmp.in.facing set value "$(facing)"
execute store result score facing bbln.tmp run data get entity @s Facing

data modify storage bubblellaneous tmp.in.rotation_x set value 0
execute if data storage bubblellaneous tmp.in{facing: "player"} facing entity @p[gamemode=!spectator] feet store result storage bubblellaneous tmp.in.rotation_y int 1 run function bubblellaneous:block_placer/internal/facing/player
execute if data storage bubblellaneous tmp.in{facing: "player_precise"} facing entity @p[gamemode=!spectator] feet store result storage bubblellaneous tmp.in.rotation_y int 1 run function bubblellaneous:block_placer/internal/facing/player_precise
execute if data storage bubblellaneous tmp.in{facing: "normal"} store result storage bubblellaneous tmp.in.rotation_y int 1 run function bubblellaneous:block_placer/internal/facing/normal
execute if data storage bubblellaneous tmp.in{facing: "wall_normal"} store result storage bubblellaneous tmp.in.rotation_y int 1 run function bubblellaneous:block_placer/internal/facing/wall_normal
execute if data storage bubblellaneous tmp.in{facing: "only_wall_normal"} store result storage bubblellaneous tmp.in.rotation_y int 1 run function bubblellaneous:block_placer/internal/facing/only_wall_normal
execute if data storage bubblellaneous tmp.in{facing: "door"} store result storage bubblellaneous tmp.in.rotation_y int 1 run function bubblellaneous:block_placer/internal/facing/door
execute if data storage bubblellaneous tmp.in{facing: "floor"} store result storage bubblellaneous tmp.in.rotation_y int 1 run function bubblellaneous:block_placer/internal/facing/floor
execute if data storage bubblellaneous tmp.in{facing: "none"} run data modify storage bubblellaneous tmp.in.rotation_y set value 0

execute as @e[type=item_display,tag=--bbln.new,limit=1,x=0] run function bubblellaneous:utils/block/set_rotation with storage bubblellaneous tmp.in
execute if score #did_cancel bbln.tmp matches 1 run return run kill @e[type=item_display,tag=--bbln.new,limit=1,x=0]

execute store result entity @e[type=item_display,tag=--bbln.new,limit=1,x=0] item.components."minecraft:custom_data".bubblellaneous.block_properties.rotation int 1 run data get storage bubblellaneous tmp.in.rotation_y
#endregion

#region Place base block
$execute if entity @s[tag=!--bbln.uses.no_base] run setblock ~ ~ ~ $(base)
$execute if block ~ ~ ~ #bubblellaneous:container run data modify block ~ ~ ~ CustomName set value $(display_name)
$playsound bubblellaneous:block.$(sound).place block @a[distance=..16] ~ ~ ~ 0.5 1 0
#endregion

#region Tags
execute if entity @s[tag=--bbln.uses.gui] run tag @e[type=item_display,tag=--bbln.new,limit=1,x=0] add --bbln.uses.gui
execute if entity @s[tag=--bbln.uses.tick] run tag @e[type=item_display,tag=--bbln.new,limit=1,x=0] add --bbln.uses.tick
execute if entity @s[tag=--bbln.uses.no_base] run tag @e[type=item_display,tag=--bbln.new,limit=1,x=0] add --bbln.uses.no_base
execute if entity @s[tag=--bbln.ignore.break_dropped_items] run tag @e[type=item_display,tag=--bbln.new,limit=1,x=0] add --bbln.ignore.break_dropped_items
execute if entity @s[tag=--bbln.ignore.break_dropped_container] run tag @e[type=item_display,tag=--bbln.new,limit=1,x=0] add --bbln.ignore.break_dropped_container
execute if entity @s[tag=--bbln.uses.timer] as @e[type=item_display,tag=--bbln.new,limit=1,x=0] run function bubblellaneous:block_placer/internal/timer
execute if entity @s[tag=--bbln.uses.blockstates] run tag @e[type=item_display,tag=--bbln.new,limit=1,x=0] add --bbln.uses.blockstates
execute if entity @s[tag=--bbln.uses.block_based_state] run tag @e[type=item_display,tag=--bbln.new,limit=1,x=0] add --bbln.uses.block_based_state
execute if entity @s[tag=--bbln.uses.blockstate_callback] run tag @e[type=item_display,tag=--bbln.new,limit=1,x=0] add --bbln.uses.blockstate_callback
execute if entity @s[tag=--bbln.uses.brightness_fix] as @e[type=item_display,tag=--bbln.new,limit=1,x=0] run function bubblellaneous:block_placer/internal/brightness_fix
execute if entity @s[tag=--bbln.uses.no_base,tag=!--bbln.uses.custom_base] as @e[type=item_display,tag=--bbln.new,limit=1,x=0] at @s run function bubblellaneous:blocks/type_specific/no_base/place with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data
execute if entity @s[tag=--bbln.uses.place] as @e[type=item_display,tag=--bbln.new,limit=1,x=0] at @s run function bubblellaneous:block_placer/internal/custom_place/run with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data
execute if entity @s[tag=--bbln.ignore.break_block_properties.rotation] run tag @e[type=item_display,tag=--bbln.new,limit=1,x=0] add --bbln.ignore.break_block_properties.rotation
execute if entity @s[tag=--bbln.ignore.break_block_properties.block_state] run tag @e[type=item_display,tag=--bbln.new,limit=1,x=0] add --bbln.ignore.break_block_properties.block_state
execute if entity @s[tag=--bbln.ignore.break_block_properties.owner_uuid] run tag @e[type=item_display,tag=--bbln.new,limit=1,x=0] add --bbln.ignore.break_block_properties.owner_uuid
execute if entity @s[tag=--bbln.ignore.break_block_properties.lock] run tag @e[type=item_display,tag=--bbln.new,limit=1,x=0] add --bbln.ignore.break_block_properties.lock
execute if entity @s[tag=--bbln.ignore.break_block_properties.pincode] run tag @e[type=item_display,tag=--bbln.new,limit=1,x=0] add --bbln.ignore.break_block_properties.pincode
execute if entity @s[tag=--bbln.ignore.break_block_properties.category] run tag @e[type=item_display,tag=--bbln.new,limit=1,x=0] add --bbln.ignore.break_block_properties.category
execute if entity @s[tag=--bbln.ignore.break_block_properties.owner] run tag @e[type=item_display,tag=--bbln.new,limit=1,x=0] add --bbln.ignore.break_block_properties.owner
execute if entity @s[tag=--bbln.ignore.blockstates_after_break] run tag @e[type=item_display,tag=--bbln.new,limit=1,x=0] add --bbln.ignore.blockstates_after_break
execute if entity @s[tag=--bbln.uses.blockstates] as @e[type=item_display,tag=--bbln.new,limit=1,x=0] at @s run function bubblellaneous:block_placer/internal/initial_update_blockstates with entity @s item.components."minecraft:custom_data".bubblellaneous.block_data
#endregion

tag @e[type=item_display,tag=--bbln.new,limit=1,x=0] remove --bbln.new
execute as @e[type=item_display,tag=--bbln.new,limit=1,x=0] at @s run function #bubblellaneous:block/all/on_place
