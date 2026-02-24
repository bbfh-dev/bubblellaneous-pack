execute store success score #modifier.shift bbln.tmp if items entity @s container.* *[minecraft:custom_data~{bubblellaneous: {is_gui: 1b}}]

execute store result score slot bbln.tmp anchored eyes positioned ^ ^ ^2 positioned as @e[type=item_display,tag=bbln.name.bubble_bench,limit=1,sort=nearest,distance=..8] run function bubblellaneous:block/bubble_bench/as_player/determine_empty_slot

tag @s add --bbln.player
execute anchored eyes positioned ^ ^ ^2 as @e[type=item_display,tag=bbln.name.bubble_bench,limit=1,sort=nearest,distance=..8] positioned as @s run function bubblellaneous:block/bubble_bench/entry/event/click
tag @s remove --bbln.player

scoreboard players set #modifier.shift bbln.tmp 0
clear @s *[custom_data~{bubblellaneous: {is_gui: true}}]
