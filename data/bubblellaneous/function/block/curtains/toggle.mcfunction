execute store result score @s bbln.block_state if score @s bbln.block_state matches 0

execute if score @s bbln.block_state matches 0 run function bubblellaneous:block/curtains/internal/neighbors/close
execute if score @s bbln.block_state matches 1 run function bubblellaneous:block/curtains/internal/neighbors/open
tag @e[type=item_display,tag=bbln.name.curtains,tag=--bbln.cached,x=0] remove --bbln.cached

playsound entity.horse.armor block @a ~ ~ ~ 0.5 1.5 0
