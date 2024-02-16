execute store result score slot local.tmp run function bubblellaneous:player/gui/action/_shift_click/determine_empty_slot

tag @s add --local.player
execute anchored eyes positioned ^ ^ ^2 as @e[type=item_display,tag=--local.name.bubble_bench,limit=1,sort=nearest] at @s run function bubblellaneous:blocks/bubble_bench/gui/on/click
tag @s remove --local.player

scoreboard players set modifier.drop local.tmp 0
scoreboard players set modifier.shift local.tmp 0
