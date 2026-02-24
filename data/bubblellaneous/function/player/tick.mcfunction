tag @e[type=item_display,tag=bbln.block,tag=!--bbln.loaded,distance=..32] add --bbln.loaded
tag @e[type=minecraft:mannequin,tag=bbln.dummy_player,tag=!--bbln.loaded,distance=..32] add --bbln.loaded
tag @s add --bbln.player

#execute store result score gamemode bbln.tmp run data get entity @s playerGameType
execute unless entity @s[gamemode=survival,scores={bbln.player.gamemode=0}] unless entity @s[gamemode=creative,scores={bbln.player.gamemode=1}] unless entity @s[gamemode=adventure,scores={bbln.player.gamemode=2}] unless entity @s[gamemode=spectator,scores={bbln.player.gamemode=3}] run function bubblellaneous:player/event/world/change_gamemode

execute if score #bench.allow_crafting bbln.settings matches 1 as @e[type=item,tag=--bbln.item,distance=..5] if items entity @s contents minecraft:glass_bottle at @s if block ~ ~-0.1 ~ crafting_table run function bubblellaneous:block/bubble_bench/settings/allow_crafting/place
execute if score @s bbln.player.right_click matches 1.. run function bubblellaneous:player/event/item/right_click
execute if predicate bubblellaneous:input/sneak run function bubblellaneous:player/event/world/sneak
execute if score @s bbln.player.drop matches 1.. run function bubblellaneous:player/event/item/drop
execute if score @s bbln.player.death_count matches 1.. run function bubblellaneous:player/event/world/die

#GUI
execute if entity @e[type=item_display,tag=bbln.name.bubble_bench,limit=1,distance=..16] run function bubblellaneous:block/bubble_bench/as_player/tick

#Sound
execute unless entity @s[tag=!--bbln.ladder.attached] unless function bubblellaneous:player/sound/timer run function bubblellaneous:player/sound/play
function bubblellaneous:block/ladder/player/tick_check
execute if entity @s[tag=--bbln.bear_trap.trapped] run function bubblellaneous:block/bear_trap/player/tick
execute if entity @s[tag=--bbln.telescope.using,predicate=bubblellaneous:check/period_2] run function bubblellaneous:block/telescope/tick
execute if entity @s[tag=--bbln.camera.spectating] run function bubblellaneous:block/surveillance_camera/player/tick
execute if entity @s[tag=--bbln.camera.leaving] at @s if loaded ~ ~ ~ run function bubblellaneous:block/surveillance_camera/player/finish_leaving
execute if entity @s[tag=--bbln.umbrella.using] unless items entity @s weapon.mainhand *[minecraft:custom_data~{bubblellaneous: {item_data: {id: "umbrella"}}}] run function bubblellaneous:item/umbrella/stop_flying
tag @s remove --bbln.player
