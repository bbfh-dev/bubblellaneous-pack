execute store success score modifier.shift local.tmp run data get entity @s Inventory[{components: {"minecraft:custom_data": {bubblellaneous: {is_gui: 1b}}}}]

execute store result score slot local.tmp run function bubblellaneous:block/bubble_bench/as_player/determine_empty_slot

tag @s add --local.player
execute anchored eyes positioned ^ ^ ^2 as @e[type=item_display,tag=local.name.bubble_bench,limit=1,sort=nearest] at @s run function bubblellaneous:block/bubble_bench/entry/event/click
tag @s remove --local.player

scoreboard players set modifier.shift local.tmp 0
clear @s #bubblellaneous:gui_item[custom_data~{bubblellaneous: {is_gui: 1b}}]
