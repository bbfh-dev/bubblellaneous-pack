tag @e[type=item_display,tag=local.block,distance=..32] add --local.loaded

execute store result score gamemode local.tmp run data get entity @s playerGameType
execute unless score gamemode local.tmp = @s local.player.gamemode run function bubblellaneous:player/event/world/change_gamemode

execute store result score @s local.player.pos_y run data get entity @s Pos[1]
execute if score @s local.player.leave matches 1.. run function bubblellaneous:player/event/world/leave
execute if score @s local.player.right_click matches 1.. run function bubblellaneous:player/event/item/right_click
execute if score @s local.player.sneak matches 1.. run function bubblellaneous:player/event/world/sneak
execute if score @s local.player.drop matches 1.. run function bubblellaneous:player/event/item/drop
execute if score @s local.player.death_count matches 1.. run function bubblellaneous:player/event/world/die

#region GUI
execute if entity @e[type=item_display,tag=local.name.bubble_bench,distance=..16] run function bubblellaneous:block/bubble_bench/as_player/tick
#endregion

#region Sound
scoreboard players remove @s[scores={local.player.sound=0..}] local.player.sound 1
execute if score @s local.player.sound matches 0 run function bubblellaneous:player/sound/play
#endregion

tag @s add --local.player
execute as @s[tag=--local.ladder.attached] run function bubblellaneous:block/ladder/player/tick
execute as @s[tag=--local.bear_trap.trapped] unless data entity @s RootVehicle run function bubblellaneous:block/bear_trap/player/tick
execute as @s[tag=--local.camera.spectating] run function bubblellaneous:block/surveillance_camera/player/tick
execute as @s[tag=--local.camera.leaving] at @s if loaded ~ ~ ~ if entity @e[type=armor_stand,tag=local.dummy_player,distance=..5] run function bubblellaneous:block/surveillance_camera/player/finish_leaving
execute as @s[tag=--local.flashlight.in_use] as @s[nbt={SelectedItem: {components: {"minecraft:custom_data": {bubblellaneous: {item_data: {id: "flashlight"}, item_properties: {is_turned_on: 1}}}}}}] anchored eyes positioned ^ ^ ^1 run function bubblellaneous:item/flashlight/tick
execute as @s[tag=--local.flashlight.in_use] as @s[nbt={equipment: {offhand: {components: {"minecraft:custom_data": {bubblellaneous: {item_data: {id: "flashlight"}, item_properties: {is_turned_on: 1}}}}}}}] anchored eyes positioned ^ ^ ^1 run function bubblellaneous:item/flashlight/tick_offhand
execute as @s[tag=--local.umbrella.using] as @s[nbt=!{SelectedItem: {components: {"minecraft:custom_data": {bubblellaneous: {item_data: {id: "umbrella"}}}}}}] run function bubblellaneous:item/umbrella/stop_flying
tag @s remove --local.player
tag @s remove --local.event_player
