scoreboard players operation @s bbln.block.id = #id_test bbln.tmp
execute at @s run function bubblellaneous:utils/dummy_player/start
scoreboard players operation #id_test bbln.tmp = @s bbln.block.id

tag @s add --bbln.telescope.using
playsound bubblellaneous:block.telescope.view block @s ~ ~ ~ 0.25 1 0
gamemode spectator @s
execute positioned as @e[type=item_display,tag=bbln.telescope_lens,predicate=bubblellaneous:check/block.id,limit=1,x=0] rotated as @s positioned ^ ^ ^7 run tp @s ~ ~-1.62 ~ ~ ~
