execute unless score FAST_TELESCOPE bbln.settings matches 1 run schedule function bubblellaneous:utils/moyang_fix 3t replace
execute if score FAST_TELESCOPE bbln.settings matches 1 run schedule function bubblellaneous:utils/moyang_fix 1t replace

execute as @a[tag=--local.telescope.using] at @s run function bubblellaneous:utils/moyang_fix_player
